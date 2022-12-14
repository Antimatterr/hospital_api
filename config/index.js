import dotenv from 'dotenv'
dotenv.config()

export const {
  APP_PORT,
  DB_PORT,
  HOST,
  USER,
  PASSWORD,
  DATABASE,
  CONNECTION_LIMIT,
  APP_URL
} = process.env;