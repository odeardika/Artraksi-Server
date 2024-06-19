import { Router } from "express";
import { authToken } from "../middleware/validate.middleware";
import { 
    getUserProfileDetail,
    getProfileImage
 } from "../controller/userController";

export const router = Router();

router.get("/user/profile", authToken, getProfileImage);

router.get("/user/details", authToken, getUserProfileDetail);