import exp from "constants";
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

export type ArticleOnly = {
    id: number,
    title: string,
    thumbnail_img: string,
    creator_id: number,
    upload_date: string,
    likes: number,
    creator_name: string,
    creator_profile: string,


}
export type ArticleContents = {
    id: number,
    text_order: number,
    text: string,
    text_type: 'paragraph' | 'heading',
    article_id: number,
};

export type ArticleData = {
    id: number,
    title: string,
    thumbnail_img: string,
    creator_id: number,
    upload_date: string,
    likes: number,
    views: number,
};



export const getAllArticles = async () => {
    const [articles] = await mysqlPool.query("SELECT * FROM articles");
    return articles;
}


export const getTopSixArticles = async () => {
    const [articles] = await mysqlPool.query("SELECT * FROM articles ORDER BY likes DESC LIMIT 6") as Article[] | any[];
    return articles 
}

export const likeArticle = async (article_id : number, user_id : number) => {
    try{
        const [updateFavoriteTableResult] = await mysqlPool.query("INSERT INTO article_favorite_list (article_id, user_id) VALUES (?, ?)", [article_id, user_id]) as any;
        if(updateFavoriteTableResult.affectedRows === 0) throw new Error("failed to update like");

        const [result] : any = await mysqlPool.query("UPDATE articles SET likes = likes+1 WHERE id = ?", [article_id]);
        if(result.affectedRows === 1){
            return true;
        }
    }
    catch(e : any){
        console.log(`[Server-like-article-db]: ${e.message}`);
        throw new Error("failed to update like");
    } 
}

export const getArticleContentPreview = async (article_id : number) => {
    const [article] = await mysqlPool.query("SELECT text FROM articles_contents WHERE article_id=? AND text_order = 0", [article_id]) as any[] as ArticleContents[][];
    return article[0];
};

export const searchArticles = async (search : string) => {
    const [articles] = await mysqlPool.query(`SELECT * FROM articles WHERE title REGEXP "${search}"`);
    return articles;
}

export const getNewestArticles = async (limit? : number) => {
    if(limit){
        const [articles] = await mysqlPool.query("SELECT * FROM articles ORDER BY upload_date DESC LIMIT ?", [limit]) as Article[] | any[];
        return articles;
    }
    const [articles] = await mysqlPool.query("SELECT * FROM articles ORDER BY upload_date DESC") as Article[] | any[];
    return articles;
}

export const getMostLikedArticle = async () => {
    const [article] = await mysqlPool.query("SELECT * FROM articles ORDER BY likes DESC LIMIT 1") as any as ArticleData[][];
    return article;
}

export const getTrendingArticles = async () => {
    const [articles] = await mysqlPool.query("SELECT * FROM articles ORDER BY views DESC LIMIT 6") as Article[] | any[];
    return articles;
}

export const getArticleContents = async (article_id : number) => {
    const [contents] = await mysqlPool.query("SELECT * FROM articles_contents WHERE article_id = ? ORDER BY text_order", [article_id]) as any as ArticleContents[][];
    return contents;
}

export const getArticleById = async (id: number) => {
    const [article] = await mysqlPool.query("SELECT * FROM articles WHERE id = ?", [id]) as any as ArticleOnly[][];
    return article;
}

export const checkArticleFavorite = async (article_id : number, user_id : number) => {
    const [result] = await mysqlPool.query("SELECT * FROM article_favorite_list WHERE article_id = ? AND user_id = ?", [article_id, user_id]);
    return result;
}

export const removeFavoriteArticle = async (article_id : number, user_id : number) => {
    try{
        const [updateFavoriteResult] = await mysqlPool.query("DELETE FROM article_favorite_list WHERE article_id = ? AND user_id = ?", [article_id, user_id]) as any;
        if(updateFavoriteResult.affectedRows === 0){
            throw new Error("failed to remove favorite");
        }
        const [result] : any = await mysqlPool.query("UPDATE articles SET likes = likes-? WHERE id = ?", [updateFavoriteResult.affectedRows, article_id]);
        if(result.affectedRows === 1){
            return true;
        }
    }
    catch(e : any){
        console.log(`[Server-remove-favorite-db]: ${e.message}`);
        throw new Error("failed to remove favorite");
    }
}