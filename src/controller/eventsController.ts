import {
    getUpcomingEvents as getUpcomingEventsDB,
    Event
} from "../utils/database/events";
import { Request, Response } from "express";
import { formatDateAndTime } from "../utils/changeDateFormat";


export const getUpcomingEvents = async (req : Request, res : Response) => {
    const limit = parseInt(req.params.limit);
    try{
        const rawEvents = await getUpcomingEventsDB(limit);
        const events : Event[] = [];
        for(const rawEvent of rawEvents){
            const date = new Date(rawEvent.event_date);
            rawEvent.event_date = formatDateAndTime(date);
            events.push(rawEvent);
        }
        res.status(200).json(events);
    }catch(error){
        console.error(error);
        res.status(500).json({message : "failed to get events"});
    }
}

export const getAllEvents = async (req : Request, res : Response) => {
    try{
        const rawEvents = await getUpcomingEventsDB();
        const events : Event[] = [];
        for(const rawEvent of rawEvents){
            const date = new Date(rawEvent.event_date);
            rawEvent.event_date = formatDateAndTime(date);
            events.push(rawEvent);
        }
        res.status(200).json(events);
    }catch(error){
        console.error(error);
        res.status(500).json({message : "failed to get events"});
    }
}