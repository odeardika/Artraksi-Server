import { Router } from "express";
import { 
    getTopArticles,
    searchArticles,  
    getNewestArticles,
    getNewestArticlesWithLimit,
    getMostLikedArticle,
    getTrendingArticles,
    getArticleContents,
    getArticleById,
    getRecomendedArticles,
    checkArticleFavorite,
    likeArticle,
    unLikeArticle
} from "../controller/articlesController";
import { authToken } from "../middleware/validate.middleware";

export const router = Router();

router.get("/articles/top", getTopArticles);

router.get("/articles/search", searchArticles);

router.get("/articles/new", getNewestArticles);

router.get("/articles/new/:limit", getNewestArticlesWithLimit);

router.get("/articles/most-liked", getMostLikedArticle);

router.get("/articles/trending", getTrendingArticles);

router.get("/articles/contents/:id", getArticleContents);

router.get("/articles/:id", getArticleById);

router.get("/articles/recomendation/:id", getRecomendedArticles);

router.get('/articles/favorite/check/:id', authToken, checkArticleFavorite);

router.post('/articles/favorite', authToken, likeArticle);

router.delete('/articles/favorite/:id', authToken, unLikeArticle);