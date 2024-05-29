import { Router } from "express";
import { regisAuth, loginAuth } from "../controller/authController";

export const router = Router();

router.post("/auth/regis", regisAuth);

router.post("/auth/login", loginAuth);