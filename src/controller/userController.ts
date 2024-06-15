import { Request, Response } from "express";

export const getProfileImage = async (req : Request | any, res : Response) => {
    try {
        const { profile_img } = req.user;
        if(!profile_img) throw new Error("Profile image not found");
        
        res.status(200).json({
            profile_img 
        });
    } catch (error) {
        res.status(500).json({message : "failed to get profile image"});
    }


}