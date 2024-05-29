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
    const [rawArticles] = await mysqlPool.query("SELECT * FROM articles ORDER BY likes DESC LIMIT 6") as Article[] | any[];

    const articles : Article[] = [];
    for (const article of rawArticles) {
        const date = new Date(article.upload_date);
        article.upload_date = `${date.getFullYear()}-${date.getMonth()}-${date.getDate()}`;
        const [user] : any = await mysqlPool.query("SELECT * FROM users WHERE id = ?", [article.creator_id]);
        article.creator_name = user[0].username;
        article.creator_profile = user[0].profile_img;
        articles.push(article);
    }

    return articles
      
}

export const likeArticle = async (id : number) => {
    const [result] : any = await mysqlPool.query("UPDATE articles SET likes = likes+1 WHERE id = ?", [id]);
    if(result.affectedRows === 1){
        return true;
    }
    throw new Error("failed to update like");
}
