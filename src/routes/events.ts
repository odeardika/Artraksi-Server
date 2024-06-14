import { Router } from "express";
import { 
    getUpcomingEvents,
    getAllEvents,
    getEventDetail
 } from "../controller/eventsController";

export const router = Router();

router.get("/events/upcoming/:limit", getUpcomingEvents);

router.get("/events/upcoming", getAllEvents);

router.get("/events/:id", getEventDetail);