import { get } from "http";
import { pool as mysqlPool } from "./connector";

export type Article = {
    id : number,
    title : string,
    thumbnail_img : string,
    creator_id : number,
    upload_date : string,
    likes : number,
    creator_name : string,
    creator_profile : string,
    
};

export const getAllArticles = async () => {
    const [articles] = await mysqlPool.query("SELECT * FROM articles");
    return articles;
}


export const getTopSixArticles = async () => {
    const [articles] = await mysqlPool.query("SELECT * FROM articles ORDER BY likes DESC LIMIT 6") as Article[] | any[];
    return articles 
}

export const likeArticle = async (id : number) => {
    const [result] : any = await mysqlPool.query("UPDATE articles SET likes = likes+1 WHERE id = ?", [id]);
    if(result.affectedRows === 1){
        return true;
    }
    throw new Error("failed to update like");
}

export const getArticleContentPreview = async (article_id : number) => {
    const [article] : any = await mysqlPool.query("SELECT text FROM articles_contents WHERE article_id=? AND text_order = 0", [article_id]);
    return article[0];
};
