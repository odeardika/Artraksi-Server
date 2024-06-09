import { Router } from "express";
import { 
    getTopArticles,
    searchArticles, 
    handleSearchPage, 
    getNewestArticles,
    getNewestArticlesWithLimit,
    getMostLikedArticle,
    getTrendingArticles,
    getArticleContents,
    getArticleById
} from "../controller/articlesController";

export const router = Router();

router.get("/articles/top", getTopArticles);

router.get("/articles/search/:keyword", searchArticles)

router.get("/articles/search ", handleSearchPage);

router.get("/articles/new", getNewestArticles);

router.get("/articles/new/:limit", getNewestArticlesWithLimit);

router.get("/articles/most-liked", getMostLikedArticle);

router.get("/articles/trending", getTrendingArticles);

router.get("/articles/contents/:id", getArticleContents);

router.get("/articles/:id", getArticleById);