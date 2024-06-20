import { Request, Response } from "express";
import { 
    getTrendingBlog as getTrendingBlogDB,
    getBlogPreview,
    getNewestBlog
} from "../utils/database/blog";
import { getUserById } from "../utils/database/users";

export const getTrendingBlog = async (req: Request, res: Response) => {
    try {
        const limit = parseInt(req.params.limit);
        const rawBlogs = await getTrendingBlogDB(limit) as any[];
        const blogs : any = [];
    
        for (const blog of rawBlogs) {
            const [user] = await getUserById(blog.creator_id) as any[];
            blog.creator_name = user.username;
            blog.creator_profile = user.profile_img;
    
            const [preview] = await getBlogPreview(blog.id) as any[];
            blog.preview = preview.text;
            blogs.push(blog);
        }
    
    
        res.status(200).json(blogs);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Internal server error" });
    }
};

export const getBlog = async (req: Request, res: Response) => {
    try {
        const rawBlogs = await getNewestBlog(6) as any[];
        const blogs : any = [];

        for (const blog of rawBlogs) {
            const [user] = await getUserById(blog.creator_id) as any[];
            blog.creator_name = user.username;
            blog.creator_profile = user.profile_img;

            const [preview] = await getBlogPreview(blog.id) as any[];
            blog.preview = preview.text;
            blogs.push(blog);
        }

        res.status(200).json(blogs);
    } catch (error : any) {
        console.log(`[server blog controller] ${error.message}`);
        res.status(500).json({ message: "failed to get blog" });
    }
}