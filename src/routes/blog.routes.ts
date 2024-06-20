import { Router } from "express";
import {
    getTrendingBlog,
    getBlog
} from "../controller/blogController";

export const router = Router();

router.get("/blog/trending/:limit", getTrendingBlog);

router.get("/blog/newest", getBlog);