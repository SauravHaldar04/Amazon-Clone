const mongoose = require("mongoose");
const ratingSchema = require("./rating");

const productSchema = mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true
    },
    description:{
        type:String,
        required:true,
        trim:true
    },
    category:{
        type:String,
        required:true,
    },
    price:{
        type:String,
        required:true,
    },
    quantity:{
        type:Number,
        required:true,
    },
    images:[
        {
            type:String,
            required:true,
        }
    ],
    ratings:[ratingSchema]

})
const Product = mongoose.model('Product',productSchema)
module.exports = Product;