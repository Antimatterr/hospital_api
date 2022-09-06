import express from "express";
import pool from "./config/database.js";
import { APP_PORT } from "./config/index.js";
import routes from './routes'
import path from "path"
import errorHandler from "./middlewares/errorHandler.js";
import auth from "./middlewares/auth.js";

const swaggerUI = require('swagger-ui-express');
const YAML = require('yamljs')
const swaggerJsDocs = YAML.load('./api.yaml')

const morgan = require('morgan')

const app = express();

app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(swaggerJsDocs))

app.use(morgan('combined'));



global.appRoot = path.resolve(__dirname);

app.use(express.urlencoded({ extended: false }))
app.use(express.json());
// /api/v1/
app.use('/', routes);
app.use('/uploads', express.static('uploads'))

app.use(errorHandler)
app.listen(APP_PORT, () => {
  console.log(`server running on ${APP_PORT}`);
})