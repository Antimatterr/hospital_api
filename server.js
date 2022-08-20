import express from "express";
import pool from "./config/database.js";
import { APP_PORT } from "./config/index.js";
import routes from './routes'
import path from "path"
import errorHandler from "./middlewares/errorHandler.js";
import auth from "./middlewares/auth.js";

const morgan = require('morgan')

const app = express();

app.use(morgan('combined'));



global.appRoot = path.resolve(__dirname);

app.use(express.urlencoded({ extended: false }))
app.use(express.json());
app.use('/api/v1', routes);
app.use('/uploads', express.static('uploads'))

app.use(errorHandler)
app.listen(APP_PORT, () => {
  console.log(`server running on ${APP_PORT}`);
})