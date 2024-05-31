import { pool as mysqlPool } from "./connector";

export const getCommunities = async () => {
    const [communities] = await mysqlPool.query("SELECT * FROM communities");
    return communities;
}