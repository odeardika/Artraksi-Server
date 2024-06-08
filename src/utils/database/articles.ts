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

export const likeArticle = async (id : number) => {
    const [result] : any = await mysqlPool.query("UPDATE articles SET likes = likes+1 WHERE id = ?", [id]);
    if(result.affectedRows === 1){
        return true;
    }
    throw new Error("failed to update like");
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