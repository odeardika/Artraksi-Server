import { Request, Response } from "express";
import { 
    getTrendingBlog as getTrendingBlogDB,
    getBlogPreview,
    getNewestBlog,
    getAllNewestBlog,
    getBlogById as getBlogByIdDB,
    getBlogContents,
    createBlog,
    addContentBlog
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

export const getBlogById = async (req: Request, res: Response) => {
    try {
        const blog_id = parseInt(req.params.id);
        const [blog] : any = await getBlogByIdDB(blog_id);

        const [user] = await getUserById(blog.creator_id) as any[];
        blog.creator_name = user.username;
        blog.creator_profile = user.profile_img;

        const contents = await getBlogContents(blog_id);
        blog.contents = contents;
        res.status(200).json(blog);

    } catch (error : any) {
        console.log(`[server blog controller] ${error.message}`);
        res.status(500).json({ message: "failed to get blog" });
    }
};

export const getOtherBlog = async (req: Request, res: Response) => {
        try {
            const id = parseInt(req.params.id);
            const rawBlogs = (await getAllNewestBlog()) as any[];
            const blogs: any = [];
            for (const blog of rawBlogs) {                
                if (blog.id === id) continue;
                const [user] = (await getUserById(blog.creator_id)) as any[];
                blog.creator_name = user.username;
                blog.creator_profile = user.profile_img;
        
                const [preview] = (await getBlogPreview(blog.id)) as any[];
                blog.preview = preview.text;
                blogs.push(blog);
            }

            res.status(200).json(blogs);
        } catch (error : any) {
            console.log(`[Server-blog-controller]: ${error.message}`);
            res.status(500).json({message : "failed to get other blog"});
        }
    
}

export const createNewBlog = async (req: Request | any, res: Response) => {
    try {
        const { id } = req.user;
        const { title, content } = req.body;
        const thumbnail_img = `assets/blogs/${req.file?.filename}`;

        const result = await createBlog(title, thumbnail_img, id) as any;

        const contents = content.split("\n");
        for (let i = 0; i < contents.length; i++) {
            const content = contents[i];
            await addContentBlog(i,content,"paragraph",result.insertId );
        }
        res.status(200).json(thumbnail_img);
        
    } catch (error : any) {
        console.log(error);
        res.status(500).json({message : "failed to create new blog"});
    }
}