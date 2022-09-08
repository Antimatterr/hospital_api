import express from "express";
import { hospitalController, loginCotroller, refreshCotroller, registerController, userController } from "../controller";
import auth from "../middlewares/auth";
import userAuth from "../middlewares/userAuth";

const router = express.Router();

router.post('/register', auth, registerController.register)
router.get('/hospital/:id', hospitalController.index)
router.post('/registerusr', userController.registerUsr)
router.post('/refresh', refreshCotroller.refresh)
router.post('/login', loginCotroller.login);
router.post('/logout', loginCotroller.logout);
router.get('/profile', userAuth, userController.userProfile);

export default router