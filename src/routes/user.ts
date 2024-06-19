import { Router } from "express";
import { authToken } from "../middleware/validate.middleware";
import { upload, upload as uploadNewProfile } from '../middleware/multer.middleware';
import { 
    getUserProfileDetail,
    getProfileImage,
    updateUserProfile
 } from "../controller/userController";

export const router = Router();

router.get("/user/profile", authToken, getProfileImage);

router.get("/user/details", authToken, getUserProfileDetail);

router.put("/user/profile", authToken, upload.single("file") , updateUserProfile);