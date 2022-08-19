import express from "express";
import { hospitalController, registerController } from "../controller";


const router = express.Router();

router.post('/register', registerController.register)
router.get('/hospital/:id', hospitalController.index)

export default router