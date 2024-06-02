import mysql from 'mysql2';
import 'dotenv/config';

export const pool =  mysql.createPool({
    host: `${process.env.SERVER}`,
    port: parseInt(`${process.env.SERVER_PORT}`),
    user: `${process.env.SERVER_USERNAME}`,
    database: `${process.env.DATABASE}`,
    password : `${process.env.PASSWORD}`,
    waitForConnections: true,
}).promise();
