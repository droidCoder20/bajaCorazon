mongoose = require 'mongoose'
Schema   = mongoose.Schema

ResponsableSchema = new Schema({
    name: 
        type: String,
        required: true
    lastname: 
        type: String,
        required: true
    address: 
        type: String
        required: true
    email: 
        type: String,
        required: true
    phone:
        type: String,
    cellphone:
        type: String,
        required: true         
    })