import { pool as mysqlPool} from './connector';

export const addUser = async (username : string, email : string, password : string) => {
    const defaultProfile = 'assets/users/default.png';
    const [result] : any = await mysqlPool.query("INSERT INTO users (username, email, password, profile_img) VALUES (?, ?, ?, ?)",
                                        [username, email, password, defaultProfile]);

    return result.insertId;
}

