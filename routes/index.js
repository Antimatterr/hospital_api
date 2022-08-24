import express from "express";
import { hospitalController, registerController } from "../controller";
import auth from "../middlewares/auth";

const router = express.Router();

router.post('/register', auth, registerController.register)
router.get('/hospital/:id', hospitalController.index)

export default router