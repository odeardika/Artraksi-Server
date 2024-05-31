import { Router } from "express";
import { getAllCommunities } from "../controller/communitiesController";

export const router = Router();

router.get("/communities", getAllCommunities);