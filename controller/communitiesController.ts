import { Request, Response } from "express";
import { getCommunities } from "../utils/database/communities";

export const getAllCommunities = async (req : Request, res : Response) => {
    try{
        const communities = await getCommunities();
        res.status(200).json(communities);
    }catch(error){
        res.status(500).json({message : "failed to get communities"});
    }
}