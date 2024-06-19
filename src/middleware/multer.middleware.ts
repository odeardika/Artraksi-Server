import multer from "multer";

const strorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "public/assets/users");
    },
    filename: (req :  any, file, cb) => {
        const filename = `${req.user.id}.${file.originalname.split(".").at(-1)}`; 
        cb(null, filename);
    }
})

export const upload = multer({ storage: strorage });

