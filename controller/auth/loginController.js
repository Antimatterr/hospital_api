import Joi, { custom } from "joi";
import CustomErrorHandler from "../../services/CustomErrorHandler";
import JwtService from "../../services/JwtService";
import bcrypt from 'bcrypt'
import { REFRESH_SECRET } from "../../config";
import pool from "../../config/database";
const util = require('util');

const query = util.promisify(pool.query).bind(pool)

const loginController = {

  async login(req, res, next) {
    const loginSchema = Joi.object({
      email: Joi.string().email().required(),
      password: Joi.string().required()
    });

    const { error } = loginSchema.validate(req.body);
    if (error) {
      return next(error);
    }


    try {
      const user = await query(`select id, email, password from lattice_user where email = '${req.body.email}'`);
      // console.log(user);
      if (!user.length) {
        return next(CustomErrorHandler.wrongCredentials());
      }

      //compare password
      const match = await bcrypt.compare(req.body.password, user[0].password);
      if (!match) {
        return next(CustomErrorHandler.wrongCredentials());
      }

      // generate token if password is correct
      const access_token = JwtService.sign({ id: user[0].id });
      const refresh_token = JwtService.sign({ id: user[0].id }, '1Y', REFRESH_SECRET);

      // add refresh_token to database

      await query(`update lattice_user set refresh_token = '${refresh_token}' where lattice_user.id = ${user[0].id}`);
      res.json({ access_token, refresh_token });


    } catch (err) {
      return next(err);
    }

  },

  async logout(req, res, next) {
    //validate request 
    const refreshSchema = Joi.object({
      refresh_token: Joi.string().required()
    });

    const { error } = refreshSchema.validate();
    if (error) {
      return next(error);
    }

    try {
      await query(`update lattice_user set refresh_token = null  where refresh_token = '${req.body.refresh_token}'`)
    } catch (err) {
      return next(new Error('Something went wrong'));
    }


    res.json({ status: 1, message: "Successfully logged out" })




  }

}

export default loginController;