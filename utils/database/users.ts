import { pool as mysqlPool} from './connector';

export const addUser = async (username : string, email : string, password : string) => {
    const defaultProfile = 'assets/users/default.png';
    const [result] : any = await mysqlPool.query("INSERT INTO users (username, email, password, profile_img) VALUES (?, ?, ?, ?)",
                                        [username, email, password, defaultProfile]);

    return result.insertId;
};

export const getUser = async (identfire : string, key : string) => {
    const [user] : any = await mysqlPool.query(`SELECT * FROM users WHERE ${key} = ?`, [identfire]);
    return user[0];
};

export const getUserById = async (user_id : number) => {
    const [user] : any = await mysqlPool.query(`SELECT * FROM users WHERE id = ?`, [user_id]);
    return user[0];
};


export type User = {
    id : number
    username : string,
    password : string,
    email : string,
    profile_img : string
};

