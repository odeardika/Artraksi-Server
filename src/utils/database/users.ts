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
    const [user] = await mysqlPool.query(`SELECT * FROM users WHERE id = ?`, [user_id]) as any[];
    return user;
};

export const getUserFavoritesArticles = async (user_id : number) => {
    const articles = await mysqlPool.query(`SELECT * FROM article_favorite_list WHERE user_id = ?`, [user_id]) as any[];
    return articles;
}

export const getUserEventsRemaindersList = async (user_id : number) => {
    const events = await mysqlPool.query(`SELECT * FROM reminder_lists WHERE user_id = ?`, [user_id]) as any[];
    return events;
}


export type User = {
    id : number
    username : string,
    password : string,
    email : string,
    profile_img : string
};

