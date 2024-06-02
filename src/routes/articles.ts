import { Router } from "express";
import { getTopArticles } from "../controller/articlesController";

export const router = Router();

router.get("/articles/top", getTopArticles);
