import { Router } from "express";
import { 
    getUpcomingEvents,
    getAllEvents,
    getEventDetail,
    addReminder,
    removeReminder,
    checkEventReminder
 } from "../controller/eventsController";

export const router = Router();

router.get("/events/upcoming/:limit", getUpcomingEvents);

router.get("/events/upcoming", getAllEvents);

router.get("/events/:id", getEventDetail);

router.post("/events/reminder", addReminder);

router.delete("/events/reminder/:id", removeReminder);

router.post("/events/reminder/check", checkEventReminder);