import mysql from 'mysql2';

export const pool =  mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'artraksi',
    password : "125125",
    waitForConnections: true,
}).promise();
