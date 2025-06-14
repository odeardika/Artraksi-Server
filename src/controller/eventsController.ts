import {
    getUpcomingEvents as getUpcomingEventsDB,
    getEventById,
    getEventGallery,
    getEventSchedule,
    addReminderIntoDatabase,
    checkReminders,
    Event,
    EventSchedule,
    removeReminderIntoDatabase,
    searchEvents as searchEventsDB
} from "../utils/database/events";
import { Request, Response } from "express";
import { formatDate, formatDateAndTime } from "../utils/changeDateFormat";
import { changeTimeFormat } from "../utils/changeTimeFormat";


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

export const getEventDetail = async (req : Request, res : Response) => {
    try{
        const id = parseInt(req.params.id);
        const [rawEvent] = await getEventById(id) as any as Event[];
        const date = new Date(rawEvent.event_date);
        rawEvent.event_date = formatDate(date,false);

        const gallery = await getEventGallery(id);

        const rawSchedule = await getEventSchedule(id) as any as EventSchedule[];

        const schedule : any[] = [];
        for(const raw of rawSchedule){  
            raw.time_start = changeTimeFormat(raw.time_start, true, true, false);
            raw.time_end = changeTimeFormat(raw.time_end, true, true, false);

            schedule.push(raw);
        }

        res.status(200).json({
            event : rawEvent,
            gallery : gallery,
            schedule : schedule
        });
    }catch(error : any){

        console.error(error);
        res.status(500).json({message : "failed to get events"});
    }
}

export const addReminder = async (req : Response | any, res : Response) => {
    try{
        const { event_id } = req.body;
        const { id } = req.user;

        const reminder = await addReminderIntoDatabase(event_id, id);

        res.status(200).json(reminder);

    }catch(error : any){
        console.error(error);
        res.status(500).json({message : "failed to add reminder"});        
    }
}

export const removeReminder = async (req : Request | any, res : Response) => {
    try {
        const event_id = parseInt(req.params.id);
        const {id} = req.user;
        const result = await removeReminderIntoDatabase(event_id, id);
        res.status(200).json({message : "Reminder removed successfully"});
    } catch (error) {
        console.error(error);
        res.status(500).json({message : "failed to remove reminder"});        
    }
}   

export const checkEventReminder = async (req : Request | any, res : Response) => {
    try {
        const event_id = parseInt(req.params.id);
        const {id} = req.user;
        const result = await checkReminders(event_id, id);
        res.status(200).json({
            is_remainder : result.length > 0,
            remaider_id : (result.length > 0)? result[0].id as number : null
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({message : "failed to add reminder"});        
    }
}


export const searchEvents = async (req : Request, res : Response) => {
    try{
        const keyword = req.query.search as string;
        const rawEvents = await searchEventsDB(keyword) as any[];
        const events : any[] = [];
        for (const event of rawEvents){
            const date = new Date(event.event_date);
            event.event_date = formatDateAndTime(date);
            events.push(event);
        }

        res.status(200).json(events);
    }catch(error : any){
        if(error.message == "Illegal argument to a regular expression."){
            return;
        }else{
            console.log(`[Server-event-controller]: ${error.message}`);
        }
    }
}

