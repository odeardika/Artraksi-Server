import { Router } from "express";
import {
    getTrendingBlog,
    getBlog,
    getBlogById,
    getOtherBlog,
    createNewBlog
} from "../controller/blogController";
import { authToken } from "../middleware/validate.middleware";
import { uploadBlogThumbnail } from "../middleware/multer.middleware";

export const router = Router();

router.get("/blog/trending/:limit", getTrendingBlog);

router.get("/blog/newest", getBlog);

router.get("/blog/detail/:id", getBlogById);

router.get('/blog/others/:id', getOtherBlog)

router.post('/blog/add', authToken, uploadBlogThumbnail.single("thumbnail") , createNewBlog);