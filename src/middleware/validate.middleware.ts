import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import 'dotenv/config';

export const authToken = (req : Request | any, res : Response, next : NextFunction) => {
    const authHeader = req.headers['authorization']
    const token = authHeader&& authHeader.split(" ")[1]
    if(!token) return res.sendStatus(401)
    jwt.verify(token, process.env.SECRETKEY as jwt.Secret, (err : any, decoded : any)=>{
        if(err) return res.sendStatus(403)
        req.user = decoded 
        next()    
    })
}
