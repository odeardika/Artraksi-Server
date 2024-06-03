export const formatDate = (date : Date, mouthInNumber : boolean = true) => {
    if(mouthInNumber) return `${date.getFullYear()}-${date.getMonth()}-${date.getDate()}`;
    else{
        const months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        return `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`;
    }
}