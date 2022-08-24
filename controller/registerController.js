import Joi from "joi";
import pool from "../config/database";
import bcrypt from "bcrypt"
import multer from "multer";
import fs from "fs";
import path from "path";
import { APP_URL, CONNECTION_LIMIT } from "../config";
import CustomErrorHandler from "../services/CustomErrorHandler";
import { threadId } from "worker_threads";



const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/'),
  filename: (req, file, cb) => {
    const uniqueName = `${Date.now()}-${Math.round(Math.random() * 1E9)}${path.extname(file.originalname)}`;
    cb(null, uniqueName)
  }
});



const handleMultipartData = multer({ storage, limits: { fileSize: 1000000 * 5 } }).single('image')



const registerController = {


  async register(req, res, next) {

    handleMultipartData(req, res, async (err) => {
      if (err) {
        return next(CustomErrorHandler.serverError(err.message))
      }

      const filePath = req.file.path;
      const dbfile = `${APP_URL}/${filePath}`;
      // console.log(req.file.path);
      // console.log(req.body)

      const psychiatrist_id = req.headers.Authorization;


      //validation 
      const passwordregex = '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';

      const registerSchema = Joi.object({
        name: Joi.string().min(4).max(40).required(),
        email: Joi.string().email().required(),
        address: Joi.string().min(10).required(),
        phone: Joi.string().min(12).max(14).pattern(new RegExp('^[+]?[0-9]{3}[0-9]{6,12}$')).required(),
        password: Joi.string().min(8).max(15).pattern(new RegExp(passwordregex)).required(),
        patient_image: Joi.string(),
      });

      const { error } = registerSchema.validate(req.body);

      function unlinkFile() {
        fs.unlink(`${appRoot}/${filePath}`, (err) => {
          if (err) {
            return next(CustomErrorHandler.serverError(err.message));
          }
        })
      }

      if (error) {
        unlinkFile();
        return next(error); //validation error
      }


      const hashedPassword = await bcrypt.hash(req.body.password, 10);

      let hospital_id;
      let patient_count;


      function create(patient) {

        pool.query(`SELECT hospital_id FROM lattice_psychiatrist WHERE id = ${psychiatrist_id}`, (err, results, fields) => {
          if (err) {
            unlinkFile();
            throw err;
          }
          hospital_id = results[0].hospital_id

          pool.query(`select count(*) as patient_count from lattice_patient group by psych_id having psych_id=${psychiatrist_id}`, (err, results, fields) => {
            if (err) {
              unlinkFile();
              throw err
            }
            patient_count = Number(results[0].patient_count) + 1;


            pool.query(
              `INSERT INTO lattice_patient(psych_id, hospital_id, name, email, address, phone, password, image) values(?,?,?,?,?,?,?,?)`,
              [
                psychiatrist_id,
                hospital_id,
                req.body.name,
                req.body.email,
                req.body.address,
                req.body.phone,
                hashedPassword,
                dbfile
              ],
              (error, results) => {
                if (error) {
                  unlinkFile();
                  throw error
                }
                // console.log(results);
              }

            )

            pool.query(`update lattice_psychiatrist set patient_count = ${patient_count} where id = ${psychiatrist_id}`), (err, results) => {
              if (err) {
                throw err;
              }

            }

          })

        })
        return patient
      }




      const { name, email, address, phone, password } = req.body;
      let user;
      try {
        user = await create({
          psychiatrist_id: psychiatrist_id,
          name,
          email,
          address,
          phone,
          password,
          image: dbfile
        });
        res.status(201).json(user);
      } catch (err) {
        return next(CustomErrorHandler.unAuthorized());
      }

    });
  }








}

export default registerController;