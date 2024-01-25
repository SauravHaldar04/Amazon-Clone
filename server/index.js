const express = require('express');
const mongoose = require('mongoose');

const authRouter = require("./routes/auth");
const admin = require('./middlewares/admin');
const adminRouter = require('./routes/admin');

const DB  = "mongodb+srv://saurav:saurav123@cluster0.n69ap.mongodb.net/?retryWrites=true&w=majority";

const PORT = 3000;
const app = express();
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);



//Creating an API
mongoose.connect(DB).then(()=>{
    console.log("Connection Successfull!");
}).catch((e)=>{
console.log(e)
})
app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT}` );
});