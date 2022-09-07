import Joi from "joi";
import pool from "../../config/database";
import bcrypt from "bcrypt"
import multer from "multer";
import fs from "fs";
import path from "path";
import JwtService from "../../services/JwtService";
import { APP_URL, CONNECTION_LIMIT } from "../../config";
import CustomErrorHandler from "../../services/CustomErrorHandler";
const util = require('util');

const query = util.promisify(pool.query).bind(pool)

const userController = {

  async registerUsr(req, res, next) {

    const passwordregex = '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';

    // User registration validation schema

    const registerUsrSchema = Joi.object({
      name: Joi.string().min(4).max(40).required(),
      email: Joi.string().email().required(),
      phone: Joi.string().min(12).max(14).pattern(new RegExp('^[+]?[0-9]{3}[0-9]{6,12}$')).required(),
      password: Joi.string().min(8).max(15).pattern(new RegExp(passwordregex)).required(),
      repeat_password: Joi.ref('password')

    });

    const { error } = registerUsrSchema.validate(req.body);
    if (error) {
      return next(error);
    }

    // console.log(req.body.email)
    // check if user is in database

    try {
      let user = await query(`select lattice_user.id from lattice_user where email = '${req.body.email}'`)
      if (user) {
        return next(CustomErrorHandler.alreadyExist('User already exists'));
      }
    } catch (err) {
      return next(err);
    }


    const { name, email, phone, password } = req.body;

    const hashedPassword = await bcrypt.hash(password, 10);

    let access_token;
    let refresh_token;

    try {

    } catch (err) {

    }



  }

}

export default userController;