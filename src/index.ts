import express ,{ Request, Response } from "express";
import { router as authRoute} from "../src/routes/auth";
import { router as articlesRoute} from "../src/routes/articles";
import { router as communitiesRoute} from "../src/routes/communities";
import { router as eventsRoute } from "./routes/events";
import { router as userRoute } from "./routes/user";
import path from "path";
import cors from "cors";

const app = express();
const port = process.env.PORT;

app.use(cors());
app.use(express.static(path.join(__dirname, '../public')));
app.use(express.json());
app.use(authRoute);
app.use(articlesRoute);
app.use(communitiesRoute);
app.use(eventsRoute);
app.use(userRoute);

app.get("/", (req : Request, res : Response) => {
    res.send(`<h1>Artraksi server is running</h1>`);
});

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});