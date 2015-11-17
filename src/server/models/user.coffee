mongoose = require 'mongoose'
Schema   = mongoose.Schema

UserSchema = new Schema({
    name:
        type: String,
        required: true
    lastname:
        type: String,
        required: true
    username:
        type: String,
        required: true
    email:
        type: String,
        required: true
    password:
        type: String,
        required: true
})

module.exports = mongoose.model('User', UserSchema)
