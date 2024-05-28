import { addUser } from "../database/users";
import bcrypt from "bcrypt";
import { validate } from "email-validator";

export const registerUser = async (username : string, email : string, password : string) => {
    // check if email is valid
    if(!validate(email)){
        throw new Error("email is not valid");
    } 

    // hashing password
    const saltRounds = 10;
    const salt = await bcrypt.genSalt(saltRounds);
    const bcryptPassword = await bcrypt.hash(password, salt);
    
    // send to database
    try{
        const insertId = await addUser(username, email, bcryptPassword);

        return {
            username : username,
            email : email,
            id : insertId,
            profile_img : 'assets/users/default.png'
        };    
    }catch(error : any){
        if(error.code === 'ER_DUP_ENTRY'){
                    const key = error.sqlMessage.split(' ').slice(-1)[0].split('.')[1].slice(0,-1);
                    throw new Error(`${key} is already have account`);
                }
        return error;
    }
}

export type RegisBody = {
    username : string,
    email : string,
    password : string

}

