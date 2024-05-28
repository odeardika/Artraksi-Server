import express ,{ Request, Response } from "express";
import { registerUser } from "./utils/auth/regis";
import path from "path";
import { error } from "console";

const app = express();
const port = 3000;

type RegisBody = {
    username : string,
    email : string,
    password : string

}

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.json())

app.get("/", (req: Request, res : Response) => {
    res.send(`Artraksi server is running`);
})

app.post("/auth/regis", (req : Request<{},{},RegisBody>, res : Response) => {
    const {username, email, password} = req.body

    registerUser(username, email, password).then(data => res.status(200).send(data)).catch(error => console.log(error));

});


app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});