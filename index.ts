import express ,{ Request, Response } from "express";
import { registerUser, RegisBody } from "./utils/auth/regis";
import { loginUser, LoginBody } from "./utils/auth/login";
import path from "path";

type TypeError = {
    message : string
}

const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json())

app.get("/", (req: Request, res : Response) => {
    res.send(`Artraksi server is running`);
})

app.post("/auth/regis", (req : Request<{},{},RegisBody>, res : Response) => {
    const {username, email, password} = req.body;

    registerUser(username, email, password)
    .then(data => res.status(200).send(data))
    .catch((error : TypeError) => {
        res.status(400).json({
            ok : false,
            message : error.message
        });
    });

});

app.post("/auth/login", (req : Request<{},{},LoginBody>, res : Response) => {
    const {identfire, password} = req.body;

    loginUser(identfire, password)
    .then(data => res.status(200).send(data))
    .catch((error : TypeError) => res.status(400).json({
        ok : false,
        message : error.message
    }));
});

app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});