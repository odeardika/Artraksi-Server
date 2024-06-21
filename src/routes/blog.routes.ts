import { Router } from "express";
import {
    getTrendingBlog,
    getBlog,
    getBlogById,
    getOtherBlog,
    createNewBlog,
    likeBlog,
    unlikeBlog,
    checkArticleFavorite,
    addViewToBlog,
    searchBlogs
} from "../controller/blogController";
import { authToken } from "../middleware/validate.middleware";
import { uploadBlogThumbnail } from "../middleware/multer.middleware";

export const router = Router();

router.get("/blog/trending/:limit", getTrendingBlog);

router.get("/blog/newest", getBlog);

router.get("/blog/detail/:id", getBlogById);

router.get('/blog/others/:id', getOtherBlog)

router.post('/blog/add', authToken, uploadBlogThumbnail.single("thumbnail") , createNewBlog);

router.post('/blog/like', authToken, likeBlog);

router.delete('/blog/like/:id', authToken, unlikeBlog);

router.get('/blog/like/check/:id', authToken, checkArticleFavorite);

router.put('/blog/view', addViewToBlog);

router.get("/blog/search", searchBlogs);