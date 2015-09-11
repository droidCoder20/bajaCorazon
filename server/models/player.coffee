mongoose = require 'mongoose'
Schema   = mongoose.Schema

PlayerSchema = new Schema({
    name: 
        type: String,
        required: true
    lastname: 
        type: String,
        required: true
    born_date:
        type: Date,
        default: Date.now
    responsable_id:
        type: Number
        required: true            
    })