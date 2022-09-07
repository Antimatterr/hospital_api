import express from "express";
import { hospitalController, registerController, userCotroller } from "../controller";
import auth from "../middlewares/auth";

const router = express.Router();

router.post('/register', auth, registerController.register)
router.get('/hospital/:id', hospitalController.index)
router.post('/registerusr', userCotroller.registerUsr)

export default router