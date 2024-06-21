import { title } from "process";
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
    const [blogs] = await mysqlPool.query("SELECT * FROM blogs");
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