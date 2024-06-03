import { Router } from "express";
import { getTopArticles, searchArticles, handleSearchPage } from "../controller/articlesController";

export const router = Router();

router.get("/articles/top", getTopArticles);

router.get("/articles/search/:keyword", searchArticles)

router.get("/articles/search/:keyword", handleSearchPage);