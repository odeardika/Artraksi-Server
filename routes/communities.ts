import { Router } from "express";
import { getAllCommunities, getCommunityDetailsData } from "../controller/communitiesController";

export const router = Router();

router.get("/communities", getAllCommunities);

router.get("/communities/:id", getCommunityDetailsData);