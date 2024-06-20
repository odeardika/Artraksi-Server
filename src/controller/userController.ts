import { Request, Response } from "express";
import { 
    getUserById, 
    getUserFavoritesArticles,
    getUserEventsRemaindersList,
    updateUserProfilePicture
} from "../utils/database/users";
import { getArticleContentPreview, getArticleById } from "../utils/database/articles";
import { formatDate, formatDateAndTime } from "../utils/changeDateFormat";
import { getEventById } from "../utils/database/events";

export const getProfileImage = async (req : Request | any, res : Response) => {
    try {
        const { profile_img } = req.user;
        if(!profile_img) throw new Error("Profile image not found");
        
        res.status(200).json({
            profile_img 
        });
    } catch (error : any) {
        console.log(`[Server-user-controller]: ${error.message}`);
        res.status(500).json({message : "failed to get profile image"});
    }
}

export const getUserProfileDetail = async (req : Request | any, res : Response) => {
    try{
        const { id } = req.user;
        const [user] = await getUserById(id);
        if(!user) throw new Error("User not found");

        const [articles] = await getUserFavoritesArticles(id);
        if(articles === undefined) throw new Error("Articles not found");

        const dataArticles : any = [];
        for(const article of articles){
            const [mainArticle] : any = await getArticleById(article.article_id);
            
            const date = new Date(mainArticle.upload_date);
            mainArticle.upload_date = formatDate(date);
            
            const preview : any = await getArticleContentPreview(article.article_id);
            mainArticle.preview = preview.text;
            
            const [user] = await getUserById(mainArticle.creator_id) as any;
            mainArticle.creator_name = user.username;
            mainArticle.creator_profile = user.profile_img;
            
            dataArticles.push(mainArticle);
        }

        const [rawEvents] = await getUserEventsRemaindersList(id);
        if(rawEvents === undefined) throw new Error("Events not found");

        const events : any = [];
        for(const rawEvent of rawEvents){
            const [mainEvent] = await getEventById(rawEvent.event_id);
            const date = new Date(mainEvent.event_date);
            mainEvent.event_date = formatDateAndTime(date);
            events.push(mainEvent);
        }
        


        res.status(200).json({
            user : {
                username : user.username,
                profile_img : user.profile_img,
                email : user.email
            },
            favorite_article : dataArticles,
            favorite_blog : [],
            remainded_event : events
        });

    }catch(error : any){
        console.log(`[Server-user-controller] ${error.message}`);
        res.status(500).json({message : "failed to get user"});
    }
}

export const updateUserProfile = async (req : Request | any, res : Response) => {
    const file = req.file as any;
    const newPicture = `assets/users/${file.filename}`;
    const result = await updateUserProfilePicture(req.user.id, newPicture);

    res.status(200).json(
        {message : "Profile picture updated"}
    );
}