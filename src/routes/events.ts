import { Router } from "express";
import { 
    getUpcomingEvents,
    getAllEvents
 } from "../controller/eventsController";

export const router = Router();

router.get("/events/upcoming/:limit", getUpcomingEvents);

router.get("/events/upcoming", getAllEvents);