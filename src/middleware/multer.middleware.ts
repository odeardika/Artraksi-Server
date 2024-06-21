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
export const uploadBlogThumbnail = multer({ storage: multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "public/assets/blogs");
    },
    filename: (req :  any, file, cb) => {
        const filename = `${Date.now() + '-' + Math.round(Math.random() * 1E9)}.${file.originalname.split(".").at(-1)}`; 
        cb(null, filename);
    }
    }) 
});
