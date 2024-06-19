import { Request, Response } from "express";
import { 
    getUserById, 
    getUserFavoritesArticles,
    getUserEventsRemaindersList,
    updateUserProfilePicture
} from "../utils/database/users";

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

        const [events] = await getUserEventsRemaindersList(id);
        if(events === undefined) throw new Error("Events not found");



        res.status(200).json({
            user : {
                username : user.username,
                profile_img : user.profile_img,
                email : user.email
            },
            favorite_article : articles,
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