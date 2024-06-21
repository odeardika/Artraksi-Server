import { pool as mysqlPool } from "./connector";

export const getTrendingBlog = async (limit: number) => {
    const [blogs] = await mysqlPool.query("SELECT * FROM blogs ORDER BY views DESC LIMIT ?", [limit]);
    return blogs;
}

export const getBlogPreview = async (blog_id: number) => {
    const [preview] = await mysqlPool.query("SELECT * FROM blog_contents WHERE blog_id = ? LIMIT 1", [blog_id]);
    return preview;
}

export const getNewestBlog = async (limit: number) => {
    const [blogs] = await mysqlPool.query("SELECT * FROM blogs ORDER BY upload_date DESC LIMIT ?", [limit]);
    return blogs;
}

export const getAllNewestBlog = async () => {
    const [blogs] = await mysqlPool.query("SELECT * FROM blogs ORDER BY upload_date DESC");
    return blogs;
}

export const getBlogById = async (blog_id: number) => {
    const [blog] = await mysqlPool.query("SELECT * FROM blogs WHERE id = ?", [blog_id]);
    return blog;
}

export const getBlogContents = async (blog_id: number) => {
    const [contents] = await mysqlPool.query("SELECT * FROM blog_contents WHERE blog_id = ?", [blog_id]);
    return contents;
}

export const createBlog = async (title: any, thumbnail_img: any, creator_id: any) => {
    const [result] = await mysqlPool.query("INSERT INTO blogs (title, thumbnail_img, creator_id) VALUES (?, ?, ?)", [title, thumbnail_img, creator_id]);
    return result;
}

export const addContentBlog = async (text_order : number, text : string, text_type : string, blog_id : number) => {
    const [result] = await mysqlPool.query("INSERT INTO blog_contents (text_order, text, text_type, blog_id) VALUES (?, ?, ?, ?)", [text_order, text, text_type, blog_id]);
    return result;
}

export const likeBlog = async (blog_id: number, user_id: number) => {
    try{
        const [updateFavoriteTableResult] = await mysqlPool.query("INSERT INTO blogs_favorite_list (blog_id, user_id) VALUES (?, ?)", [blog_id, user_id]) as any;
        if(updateFavoriteTableResult.affectedRows === 0) throw new Error("failed to update like");

        const [result] : any = await mysqlPool.query("UPDATE blogs SET likes = likes+1 WHERE id = ?", [blog_id]);
        if(result.affectedRows === 1){
            return true;
        }
    }
    catch(e : any){
        console.log(`[Server-like-blog-db]: ${e.message}`);
        throw new Error("failed to update like");
    }
}

export const unlikeBlog = async (blog_id: number, user_id: number) => {
    try{
        const [updateFavoriteResult] = await mysqlPool.query("DELETE FROM blogs_favorite_list WHERE blog_id = ? AND user_id = ?", [blog_id, user_id]) as any;
        if(updateFavoriteResult.affectedRows === 0){
            throw new Error("failed to remove like");
        }
        const [result] : any = await mysqlPool.query("UPDATE blogs SET likes = likes-? WHERE id = ?", [updateFavoriteResult.affectedRows, blog_id]);
        if(result.affectedRows === 1){
            return true;
        }
    }
    catch(e : any){
        console.log(`[Server-remove-favorite-db]: ${e.message}`);
        throw new Error("failed to remove favorite");
    }
};

export const checkBlogFavorite = async (blog_id : number, user_id : number) => {
    const [result] = await mysqlPool.query("SELECT * FROM blogs_favorite_list WHERE blog_id = ? AND user_id = ?", [blog_id, user_id]);
    return result;
}

export const addViewsBlog = async (blog_id: number) => {
    const [result] = await mysqlPool.query("UPDATE blogs SET views = views+1 WHERE id = ?", [blog_id]);
    return result;
}

export const searchBlogs = async (search : string) => {
    const [blogs] = await mysqlPool.query(`SELECT * FROM blogs WHERE title REGEXP "${search}"`);
    return blogs;
}