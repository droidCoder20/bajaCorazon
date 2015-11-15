Attendance = require '../models/attendance'

module.exports = (router) ->
    router.route '/attendances'
        .post (req,res) ->
            attendance = new Attendance()
            attendance.player_id = req.body.player_id
            attendance.date = req.body.date

            attendance.save (error) ->
                if error
                    res.send(error)

                res.json({ message: 'Attendance Captured' })

        .get (req, res) ->
            Attendance.find (error, attendances) ->
                if error
                    res.send(error)

                res.json(attendances)

    router.route '/attendances/:player_id'
        .get (req, res) ->
            Attendance.findById req.params.player_id, (error, playerAttendance) ->
                if error
                    res.send(error)

                res.json(playerAttendance)

        .put (req, res) ->
            Attendance.findById req.params.player_id, (error, playerAttendance) ->
                if error
                    res.send(error)

                playerAttendance.player_id = req.body.player_id
                playerAttendance.date = req.body.date

                playerAttendance.save (error) ->
                    if error
                        res.send(error)

                    res.json({ message: 'Attendance Updated!'})

        .delete (req, res) ->
            Attendance.remove { _id: req.params.player_id }, (error, playerAttendance) ->
                if error
                    res.send(error)

                res.json({ message: 'Attendance Successfully deleted!'})
