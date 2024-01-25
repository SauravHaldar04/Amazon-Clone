const express = require('express')
const adminRouter = express.Router
const admin = require('../middlewares/admin')
const authRouter = require('./auth')
const Product = require('../models/product')

authRouter.post('/admin/add-product',admin,async (req,res)=>{
    try {
        const {name,description,price,quantity,category,images} = req.body
        let product = new Product({
            name,
            description,
            category,
            price,
            quantity,
            images
        })
        product = await product.save();
        return res.json(product)
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})
module.exports = adminRouter