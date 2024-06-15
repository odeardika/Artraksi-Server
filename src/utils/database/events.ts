import {pool as mysqlPool} from "./connector";

export type Event = {
    id: number;
    title: string;
    event_date: string;
    event_description: string;
    event_location: string;
    event_location_detail: string;
    event_thumbnail: string;
}

export type EventGallery = {
    id: number;
    event_id: number;
    img_url: string;
}

export type EventSchedule = {
    id: number;
    event_id: number;
    event_detail: string;
    time_start: string;
    time_end: string;
}

export type ReminderRequestBody = {
    event_id: number,
    user_id: number
}

export const getUpcomingEvents = async (limit? : number) => {
    if(limit){
        const [events] = await mysqlPool.query("SELECT * FROM events ORDER BY event_date ASC LIMIT ?", [limit]) as Event[] | any;
        return events;
    }
    const [events] = await mysqlPool.query("SELECT * FROM events ORDER BY event_date ASC") as any as Event[][];
    return events;
}

export const getEventById = async (event_id : number) => {
    const [event] = await mysqlPool.query("SELECT * FROM events WHERE id = ?", [event_id]) as any as Event[][];
    return event;
}

export const getEventGallery = async (event_id : number) => {
    const [gallery] = await mysqlPool.query("SELECT * FROM event_gallery WHERE event_id = ?", [event_id]) as any as EventGallery[][];
    return gallery;
}

export const getEventSchedule = async (event_id : number) => {
    const [schedule] = await mysqlPool.query("SELECT * FROM event_schedules WHERE event_id = ?", [event_id]) as any as EventSchedule[][];
    return schedule;
}

export const addReminderIntoDatabase = async (event_id : number, user_id : number) => {
    const [result] = await mysqlPool.query("INSERT INTO reminder_lists (event_id, user_id) VALUES (?, ?)", [event_id, user_id]) as any as number[];
    return result;
}

export const removeReminderIntoDatabase = async (event_id : number, user_id : number) => {
    const [result] = await mysqlPool.query("DELETE FROM reminder_lists WHERE event_id = ? AND user_id = ?", [event_id, user_id]) as any as number[];
    return result;
}

export const checkReminders = async (event_id : number, user_id : number) => {
    const [result] = await mysqlPool.query("SELECT * FROM reminder_lists WHERE event_id = ? AND user_id = ?", [event_id, user_id]) as any[][];
    return result;
}