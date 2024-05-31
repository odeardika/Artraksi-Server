import express ,{ Request, Response } from "express";
import { router as authRoute} from "./routes/auth";
import { router as articlesRoute} from "./routes/articles";
import { router as communitiesRoute} from "./routes/communities";
import path from "path";
import cors from "cors";

const app = express();
const port = 3000;

app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json());
app.use(authRoute);
app.use(articlesRoute);
app.use(communitiesRoute);

app.get("/", (req : Request, res : Response) => {
    res.send(`Artraksi server is running`);
});

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});