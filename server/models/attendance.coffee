mongoose = require 'mongoose'
Schema   = mongoose.Schema

AttendanceSchema = new Schema({
    player_id:
        type: String,
        required: true
    date:
        type: Date,
        default: Date.now
})

module.exports = mongoose.model('Attendance', AttendanceSchema)
