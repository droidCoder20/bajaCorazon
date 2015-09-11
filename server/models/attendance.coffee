mongoose = require 'mongoose'
Schema   = mongoose.Schema

AttendanceSchema = new Schema({
    player_id: 
        type: Number,
        required: true
    date:
        type: Date,
        default: Date.now
    })