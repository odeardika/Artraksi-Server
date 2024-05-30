import { Request, Response } from 'express';
import { getArticleContentPreview, getTopSixArticles, Article } from '../utils/database/articles';
import { getUserById, User } from '../utils/database/users';


export const getTopArticles =  async (req : Request, res : Response) => {
    try{
        const rawArticles = await getTopSixArticles();
        const articles : Article[] = [];
        for (const article of rawArticles) {
            const date = new Date(article.upload_date);
            article.upload_date = `${date.getFullYear()}-${date.getMonth()}-${date.getDate()}`;
            
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

