const express = require('express')
const productRouter = express.Router()
const auth = require('../middlewares/auth')
const Product = require('../models/product')
productRouter.get('/api/products',auth,async (req,res)=>{
    try {
        const products = await Product.find({category:req.query.category});
        res.json(products)
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})

productRouter.get('/api/products/search/:name',auth, async (req,res)=>{
    try {
        const products = await Product.find({name:{$regex:req.params.name,$options:'i'}});
        res.json(products)
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})

productRouter.post('/api/rate-product',auth,async(req,res)=>{
    try {
        const{id,rating} = req.body
        let product = await Product.findById(id);
        for(i=0;i<product.ratings.length;i++){
         if(product.ratings[i].userID==req.user){
            product.ratings.splice(i,1)
            break;
         }
        }
        const ratingSchema = {
            userID : req.user,
            rating
        }
        product.ratings.push(ratingSchema)
        product = await product.save()
        res.json(product)
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})

module.exports = productRouter;