import {pool as mysqlPool} from "./connector";

export type Event = {
    id: number;
    title: string;
    event_date: Date;
    event_description: string;
    event_location: string;
    event_location_detail: string;
    event_thumbnail: string;
}

export const getUpcomingEvents = async (limit? : number) => {
    if(limit){
        const [events] = await mysqlPool.query("SELECT * FROM events ORDER BY event_date ASC LIMIT ?", [limit]) as Event[] | any;
        return events;
    }
    const [events] = await mysqlPool.query("SELECT * FROM events ORDER BY event_date ASC") as any as Event[];
    return events;
}