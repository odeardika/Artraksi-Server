import { stringify } from "querystring";

export const formatDate = (date : Date, mouthInNumber : boolean = true) => {
    if(mouthInNumber) return `${date.getFullYear()}-${date.getMonth()}-${date.getDate()}`;
    else{
        const months = ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"];
        return `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`;
    }
}

const fixTimeFormat = (time : number) => {
    if(time > 0){
        return time;
    }
    const setTime = ["00","01","02","03","04","05","06","07","08","09"];
    return setTime[time];
}
export const formatDateAndTime = (date : Date) => {
    const months = ["Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember"];
    return `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()} | ${fixTimeFormat(date.getHours())}:${fixTimeFormat(date.getMinutes())}`;
}