import { getUser, User } from "../database/users";
import bcrypt from "bcrypt";
import { validate } from "email-validator";

export const loginUser = async (identfire : string, password : string) => {

    let user : User; 

    // if the identfire is email
    if(validate(identfire)){
        try {
            user = await getUser(identfire, 'email');
            if(!user) throw new Error("Email not found");
            
            const isPasswordValid = await bcrypt.compare(password, user.password)
            if(isPasswordValid){
                return {
                    username : user.username,
                    email : user.email,
                    id : user.id,
                    profile_img : user.profile_img
                };
            }else{
                throw new Error("Password was inccorect");
            }

        } catch (error : any) {
            throw new Error(error.message);
        }
    }

    try{
        user = await getUser(identfire, 'username');
        if(!user) throw new Error("Username not found");
        
        const isPasswordValid = await bcrypt.compare(password, user.password)
        if(isPasswordValid){
            return {
                username : user.username,
                email : user.email,
                id : user.id,
                profile_img : user.profile_img
            };
        }
        throw new Error("Password was inccorect");
            

    }catch(error : any){
        throw new Error(error.message);
    }
}

export type LoginBody = {
    identfire : string,
    password : string
}
