import { Router } from "express";
import { 
    getTopArticles,
    searchArticles, 
    handleSearchPage, 
    getNewestArticles,
    getNewestArticlesWithLimit,
    getMostLikedArticle
} from "../controller/articlesController";

export const router = Router();

router.get("/articles/top", getTopArticles);

router.get("/articles/search/:keyword", searchArticles)

router.get("/articles/search ", handleSearchPage);

router.get("/articles/new", getNewestArticles);

router.get("/articles/new/:limit", getNewestArticlesWithLimit);

router.get("/articles/most-liked", getMostLikedArticle);