import { Request, Response } from 'express';
import { registerUser, RegisBody } from '../utils/auth/regis';
import { loginUser, LoginBody } from '../utils/auth/login';

export const regisAuth = async (req : Request<{},{},RegisBody>, res : Response) => {
    const {username, email, password} = req.body;

    registerUser(username, email, password)
    .then(data => res.status(200).send(data))
    .catch((error : TypeError) => {
        res.status(400).json({
            ok : false,
            message : error.message
        });
    });
}

export const loginAuth = async (req : Request<{},{},LoginBody>, res : Response) => {
    const {identfire, password} = req.body;

    loginUser(identfire, password)
    .then(data => res.status(200).send(data))
    .catch((error : TypeError) => res.status(400).json({
        ok : false,
        message : error.message
    }));
}