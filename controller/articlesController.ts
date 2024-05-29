import { Request, Response } from 'express';
import { getTopSixArticles } from '../utils/database/articles';

export const getTopArticles =  async (req : Request, res : Response) => {
    getTopSixArticles()
    .then((data : any) => {
        res.status(200).json(data);
    })
    .catch();
}

