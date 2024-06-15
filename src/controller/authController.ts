import { Request, Response } from 'express';
import { registerUser, RegisBody } from '../utils/auth/regis';
import { loginUser, LoginBody } from '../utils/auth/login';
import jwt from 'jsonwebtoken';
import 'dotenv/config';

export const regisAuth = async (req : Request<{},{},RegisBody>, res : Response) => {
    const {username, email, password} = req.body;

    registerUser(username, email, password)
    .then(data => {
        jwt.sign(data, process.env.SECRETKEY as jwt.Secret, (err : any, token : any) => {
            if(err) throw err;
            
            res.status(200).send({
                ok : true,
                Authorization:`Bearer ${token}`
            })
        })
    })
    .catch((error : TypeError) => {
        res.status(400).json({
            ok : false,
            message : error.message
        });
    });
}

export const loginAuth = async (req : Request<{},{},LoginBody>, res : Response) => {
    const {identifire, password} = req.body;

    loginUser(identifire, password)
    .then(data => {
        jwt.sign(data, process.env.SECRETKEY as jwt.Secret, (err : any, token : any) => {
            if(err) throw err;
            
            res.status(200).send({
                ok : true,
                Authorization:`Bearer ${token}`
            })
        })
    })
    .catch((error : TypeError) => res.status(400).json({
        ok : false,
        message : error.message
    }));
}