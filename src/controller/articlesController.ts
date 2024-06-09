import { Request, response, Response } from 'express';
import { 
    getArticleContentPreview, 
    getTopSixArticles, 
    Article,
    searchArticles as searchArticlesDB,
    getNewestArticles as getNewestArticlesDB,
    getMostLikedArticle as getMostLikedArticleDB,
    getTrendingArticles as getTrendingArticlesDB,
    getArticleContents as getArticleContentsDB,
    getArticleById as getArticleByIdDB
} from '../utils/database/articles';
import { formatDate } from '../utils/changeDateFormat';
import { getUserById, User } from '../utils/database/users';


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
    }catch(error){
        res.status(500).json({message : "failed to get top articles"});
    }
}

export const searchArticles = async (req : Request, res : Response) => {
    try{
        const keyword = req.params.keyword as string
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
    }catch(error){
    
    }
}

export const handleSearchPage = async (req : Request, res : Response) => {
    try{
        res.status(200).send("<h1>Search Article Routes</h1>");
    }catch(error){
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
    } catch (error) {
        console.log(error);
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
    }catch(error){
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
    }catch(error){
        res.status(500).json({message : "failed to get top articles"});
    }
}

export const getArticleContents = async (req : Request, res : Response) => {
    try{
        const article_id = parseInt(req.params.id);
        const rawContents = await getArticleContentsDB(article_id);
        res.status(200).json(rawContents);
    }catch(error){
        console.error(error);
        res.status(500).json({message : "failed to get article contents"});
    }
}

export const getArticleById = async (req : Request, res : Response) => {
    try{
        const id = parseInt(req.params.id);
        const [article] = await getArticleByIdDB(id);
        const user = await getUserById(article.creator_id);
        res.status(200).json({
            ...article,
            creator_name : user.username,
            creator_profile : user.profile_img
        });
    }catch(error : any){
        console.error(error);
        throw new Error("failed to get article");
    }
}
