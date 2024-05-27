import express ,{ Request, Response } from "express";

const app = express();
const port = 3000;

app.get("/", (req: Request, res : Response) => {
    res.send("<h1>Artraksi Server Running");
})

app.post("/auth/regis", (req : Request, res : Response) => {
    
})

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});