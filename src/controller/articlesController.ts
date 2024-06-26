import { Request, Response } from 'express';
import { 
    getArticleContentPreview, 
    getTopSixArticles, 
    searchArticles as searchArticlesDB,
    getNewestArticles as getNewestArticlesDB,
    getMostLikedArticle as getMostLikedArticleDB,
    getTrendingArticles as getTrendingArticlesDB,
    getArticleContents as getArticleContentsDB,
    getArticleById as getArticleByIdDB,
    checkArticleFavorite as checkArticleFavoriteDB,
    likeArticle as likeArticleDB,
    removeFavoriteArticle as unLikeArticleDB
} from '../utils/database/articles';
import { formatDate } from '../utils/changeDateFormat';
import { getUserById, User } from '../utils/database/users';

export type Article = {
    id : number,
    title : string,
    upload_date : string,
    likes : number,
    views : number,
    creator_id : number,
    preview : string,
    creator_name : string,
    creator_profile : string,
    thumbnail_img : string
}


export const getTopArticles =  async (req : Request, res : Response) => {
    try{
        const rawArticles = await getTopSixArticles();
        const articles : Article[] = [];
        for (const article of rawArticles) {
            const date = new Date(article.upload_date);
            article.upload_date = formatDate(date);
            
            const preview : any = await getArticleContentPreview(article.id);
            article.preview = preview.text;

            const user = await getUserById(article.creator_id) as User;
            article.creator_name = user.username;
            article.creator_profile = user.profile_img;
            
            articles.push(article);
        }
        res.status(200).json(articles);
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get top articles"});
    }
}

export const searchArticles = async (req : Request, res : Response) => {
    try{
        const keyword = req.query.search as string;
        const rawArticles = await searchArticlesDB(keyword) as any[];
        const articles : Article[] = [];
        for (const article of rawArticles){
            const date = new Date(article.upload_date);
            article.upload_date = formatDate(date, false);
            
            const preview : any = await getArticleContentPreview(article.id);
            article.preview = preview.text;

            const user = await getUserById(article.creator_id) as User;
            article.creator_name = user.username;
            article.creator_profile = user.profile_img;
            
            articles.push(article);
        }

        res.status(200).json(articles);
    }catch(error : any){
        if(error.message == "Illegal argument to a regular expression."){
            return;
        }else{
            console.log(`[Server-article-controller]: ${error.message}`);
        }
    }
}

export const handleSearchPage = async (req : Request, res : Response) => {
    try{
        res.status(200).send("<h1>Search Article Routes</h1>");
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get article"});
    }
}

export const getNewestArticles = async (req : Request, res : Response) => {
    try {
        const rawArticles = await getNewestArticlesDB();
        const articles : Article[] = [];
        for (const article of rawArticles) {
            const preview : any = await getArticleContentPreview(article.id);
            if(preview === undefined){
                article.preview = "";
            }else{
                article.preview = preview.text;
            }

            const date = new Date(article.upload_date);
            article.upload_date = formatDate(date);
            

            const user = await getUserById(article.creator_id) as User;
            article.creator_name = user.username;
            article.creator_profile = user.profile_img;
            
            articles.push(article);
        }
        res.status(200).json(articles);
    } catch (error : any) {
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get article"});
    }

}

export const getMostLikedArticle = async (req : Request, res : Response) => {
    try{
        const [article] = await getMostLikedArticleDB();
        const preview = await getArticleContentPreview(article.id);
        res.status(200).json({
            ...article,
            preview : preview.text
        });
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get article"});
    }
}

export const getNewestArticlesWithLimit = async (req : Request, res : Response) => {
    try {
        const limit = parseInt(req.params.limit);

        const rawArticles = await getNewestArticlesDB(limit);
        const articles : Article[] = [];
        for (const article of rawArticles) {
            const preview : any = await getArticleContentPreview(article.id);
            if(preview === undefined){
                article.preview = "";
            }else{
                article.preview = preview.text;
            }

            const date = new Date(article.upload_date);
            article.upload_date = formatDate(date, false);
            

            const user = await getUserById(article.creator_id) as User;
            article.creator_name = user.username;
            article.creator_profile = user.profile_img;
            
            articles.push(article);
        }
        res.status(200).json(articles);
    } catch (error) {
        console.log(error);
    }
}

export const getTrendingArticles = async (req : Request, res : Response) => {
    try{
        const rawArticles = await getTrendingArticlesDB();
        const articles : Article[] = [];
        for (const article of rawArticles) {
            const date = new Date(article.upload_date);
            article.upload_date = formatDate(date);
            
            const preview : any = await getArticleContentPreview(article.id);
            article.preview = preview.text;

            const user = await getUserById(article.creator_id) as User;
            article.creator_name = user.username;
            article.creator_profile = user.profile_img;
            
            articles.push(article);
        }
        res.status(200).json(articles);
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get top articles"});
    }
}

export const getArticleContents = async (req : Request, res : Response) => {
    try{
        const article_id = parseInt(req.params.id);
        const rawContents = await getArticleContentsDB(article_id);
        res.status(200).json(rawContents);
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get article contents"});
    }
}

export const getArticleById = async (req : Request, res : Response) => {
    try{
        const id = parseInt(req.params.id);
        const [article] = await getArticleByIdDB(id);
        const [user] = await getUserById(article.creator_id);
        res.status(200).json({
            ...article,
            creator_name : user.username,
            creator_profile : user.profile_img
        });
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get article"});
    }
}

export const getRecomendedArticles = async (req : Request, res : Response) => {
    try{
        const article_id = parseInt(req.params.id);
        const rawArticles = await getNewestArticlesDB();
        const articles : Article[] = [];
        let i = 0;
        while(articles.length < 6){
            const temp = rawArticles[i];
            if(temp === undefined){
                break;
            }
            if(temp.id === article_id){
                i++;
                continue;
            }
            const preview = await getArticleContentPreview(temp.id);
            temp.preview = preview.text;
            const date = new Date(temp.upload_date);
            temp.upload_date = formatDate(date);
            const user = await getUserById(temp.creator_id) as User;
            temp.creator_name = user.username;
            temp.creator_profile = user.profile_img;
            articles.push(temp);
            i++;
        }

        res.status(200).json(articles);
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get articles"});
    }  
}

export const checkArticleFavorite = async (req : Request | any, res : Response) => {
    try{
        const article_id = parseInt(req.params.id);
        const { id } = req.user;
        const result = await checkArticleFavoriteDB(article_id, id) as any;
        res.status(200).json({
            is_favorite : result.length > 0
        })
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to check article favorite"});
    }
}

export const likeArticle = async (req : Request | any, res : Response) => {
    try{
        const article_id = req.body.article_id;
        const { id } = req.user;

        const result = await likeArticleDB(article_id, id);

        res.status(200).json({
            message : "Favorite added"
        });
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to like article"});
    }
}

export const unLikeArticle = async (req : Request | any, res : Response) => {
    try{
        const article_id = parseInt(req.params.id);
        const { id } = req.user;

        const result = await unLikeArticleDB(article_id, id);

        res.status(200).json({
            message : "Favorite removed"
        });
    }catch(error : any){
        console.log(`[Server-article-controller]: ${error.message}`);
        res.status(500).json({message : "failed to unlike article"});
    }
}