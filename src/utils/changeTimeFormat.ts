export const changeTimeFormat = (time : string, useHour : boolean = true, useMinute : boolean = true, useSecond : boolean = true) => {
    const [hour, minute, second] = time.split(':');
    let result = '';

    if(useHour){
        result += hour;
    } 

    if(useMinute){
        result += `:${minute}`;
    }

    if(useSecond){
        result += `:${second}`;
    }

    return result;
}