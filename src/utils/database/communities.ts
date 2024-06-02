import { pool as mysqlPool } from "./connector";

export type Community = {
    id: number,
    comunity_name: string,
    comunity_description: string,
    logo_img: string,
    thumbnail_img: string
}

export type CommunityDetails = {
    id: number,
    community_id : number,
    comunity_detail : string,
    leader_name : string,
    leader_img : string,
    leader_desc : string,
}

export type CommunityGallery = {
    id: number,
    community_id: number,
    img_url: string
}

export type CommunityActivity = {
    id: number,
    community_id: number,
    activity_name: string,
    activity_img : string,
    activity_description: string,
}

export const getCommunities = async () => {
    const [communities] = await mysqlPool.query("SELECT * FROM communities");
    return communities;
}

export const getCommunityById = async (communityId: number) => {
    const [community] = await mysqlPool.query("SELECT * FROM communities WHERE id = ?", [communityId]) as any as Community[];
    return community;
}

export const getCommunityDetails = async (communityId: number) => {
    const [communityDetails] = await mysqlPool.query("SELECT * FROM communities_detail WHERE id = ?", [communityId]) as any as CommunityDetails[];
    return communityDetails;
}

export const getCommunityBTSGallery = async (communityId: number) => {
    const [communityGalery] = await mysqlPool.query("SELECT * FROM communities_behind_gallery WHERE community_id = ?", [communityId]) as any as CommunityGallery[];
    return communityGalery;
}

export const getCommunityPerformanceGallery = async (community_id: number) => {
    const [galleryDetails] = await mysqlPool.query("SELECT * FROM communities_performance_gallery WHERE community_id = ?", [community_id]) as any as CommunityGallery[];
    return galleryDetails;
}

export const getCommunityActivities = async (community_id: number) => {
    const [activities] = await mysqlPool.query("SELECT * FROM communities_activity WHERE community_id = ?", [community_id]) as any as CommunityActivity[];
    return activities;
}
