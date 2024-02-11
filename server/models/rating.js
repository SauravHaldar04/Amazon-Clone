const mongoose = require('mongoose')

const ratingSchema = mongoose.Schema({
    userID:{
        type:String,
        required:true
    },
    rating:{
        type:Number,
        required:true
    }
})

module.exports = ratingSchema