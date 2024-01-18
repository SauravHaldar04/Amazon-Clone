const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim :true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
          validator: (value) => {
            const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          message: "Please enter a valid email address",
        },
      },
    password:{
        type:String,
        required:true,
    },
    address:{
        type:String,
        default:''
    },
    type:{
        type:String,
        default:"user"
    }
   
})
const User = mongoose.model('User',userSchema)
module.exports = User;