import { Request, Response } from 'express';
import { 
    getArticleContentPreview, 
    getTopSixArticles, 
    Article,
    searchArticles as searchArticlesDB 
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
        res.status(200).json({message : "<h1>Search Article Routes</h1>"});
    }catch(error){
        res.status(500).json({message : "failed to get article"});
    }
}
