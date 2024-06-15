import { Router } from "express";
import { 
    getUpcomingEvents,
    getAllEvents,
    getEventDetail,
    addReminder,
    removeReminder,
    checkEventReminder
} from "../controller/eventsController";
import { authToken } from "../middleware/validate.middleware";


export const router = Router();

router.get("/events/upcoming/:limit", getUpcomingEvents);

router.get("/events/upcoming", getAllEvents);

router.get("/events/:id", getEventDetail);

router.post("/events/reminder", authToken, addReminder);

router.delete("/events/reminder/:id", authToken, removeReminder);

router.get("/events/reminder/check/:id", authToken, checkEventReminder);