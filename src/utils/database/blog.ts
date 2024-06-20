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