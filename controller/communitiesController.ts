import { Request, Response } from "express";
import {
    getCommunities, 
    getCommunityById, 
    getCommunityDetails, 
    Community, 
    CommunityActivity, 
    getCommunityBTSGallery, 
    CommunityGallery, 
    getCommunityPerformanceGallery, 
    CommunityDetails, 
    getCommunityActivities 
} from "../utils/database/communities";

export const getAllCommunities = async (req : Request, res : Response) => {
    try{
        const communities = await getCommunities();
        res.status(200).json(communities);
    }catch(error){
        res.status(500).json({message : "failed to get communities"});
    }
}

export type CommunityData = {
    id: number,
    name: string,
    description: string,
    logo : string,
    leader: {
        name: string,
        img: string,
        description: string
    },
    activities: CommunityActivity[],
    behindTheScenesGallery: CommunityGallery[],
    performanceGallery: CommunityGallery[]
}

export const getCommunityDetailsData = async (req : Request, res : Response) => {
    try{
        const communityDetails = {} as CommunityData;
        
        const communityId = parseInt(req.params.id);
        communityDetails.id = communityId;

        // get community data
        const [communityData] = await getCommunityById(communityId) as any as Community[];
        communityDetails.name = communityData.comunity_name;
        communityDetails.logo = communityData.logo_img;
        
        // get community leader data from details data
        const [detailDatas] = await getCommunityDetails(communityId) as any as CommunityDetails[];
        communityDetails.description = detailDatas.comunity_detail;
        communityDetails.leader = {
            name: detailDatas.leader_name,
            img: detailDatas.leader_img,
            description: detailDatas.leader_desc
        }

        // get community activities
        const activities = await getCommunityActivities(communityId) as any as CommunityActivity[];
        communityDetails.activities = activities;

        // get community behind the scenes gallery
        const behindTheScenesGallery = await getCommunityBTSGallery(communityId) as any as CommunityGallery[];
        communityDetails.behindTheScenesGallery = behindTheScenesGallery;

        // get community performance gallery
        const performanceGallery = await getCommunityPerformanceGallery(communityId) as any as CommunityGallery[];
        communityDetails.performanceGallery = performanceGallery;

        res.status(200).json(communityDetails);
    }catch(error){
        console.log(error);
        res.status(500).json({message : "failed to get community details"});
    }
}