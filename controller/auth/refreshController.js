import Joi from "joi";
import { REFRESH_SECRET } from "../../config";
import CustomErrorHandler from "../../services/CustomErrorHandler";
import JwtService from "../../services/JwtService";
import pool from "../../config/database";
const util = require('util');


const query = util.promisify(pool.query).bind(pool);

const refreshController = {

  async refresh(req, res, next) {

    // validate request
    const refreshSchema = Joi.object({
      refresh_token: Joi.string().required()
    });

    const { error } = refreshSchema.validate(req.body);

    if (error) {
      return next(error);
    }
    // check database for refresh_token and if it exists give back the access token to response

    let refreshtoken;

    try {

      refreshtoken = await query(`select refresh_token from lattice_user where refresh_token = '${req.body.refresh_token}'`);
      // console.log(refreshtoken[0].refresh_token);
      if (!refreshtoken) {
        return next(CustomErrorHandler.unAuthorized('Invalid request'))
      }

      let userId;

      try {
        const { id } = await JwtService.verify(refreshtoken[0].refresh_token, REFRESH_SECRET);
        userId = id;
        console.log(userId);
      } catch (err) {
        return next(CustomErrorHandler.unAuthorized('Invalid request'));
      }

      const user = await query(`select id from lattice_user where id = ${userId}`);
      if (!user) {
        return next(CustomErrorHandler.unAuthorized('No user found'));
      }

      const access_token = JwtService.sign({ id: userId });
      const refresh_token = JwtService.sign({ id: userId }, '1Y', REFRESH_SECRET);

      //add refresh token to database

      await query(`insert into lattice_user(refresh_token) values(?)`, [refresh_token]);
      res.json({ access_token, refresh_token });

    } catch (err) {
      return next(new Error('Something went wrong' + err.message));
    }



  }
}


export default refreshController;