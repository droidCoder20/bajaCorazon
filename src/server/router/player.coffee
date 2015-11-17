Player = require '../models/player'

module.exports = (router) ->
    router.route '/players'
        .post (req,res) ->
            player = new Player()
            player.name = req.body.name
            player.lastname = req.body.lastname
            player.born_date = req.body.born_date
            player.responsable_id = req.body.responsable_id

            player.save (error) ->
                if error
                    res.send(error)

                res.json({ message: 'Player Created' })

        .get (req, res) ->
            Player.find (error, players) ->
                if error
                    res.send(error)

                res.json(players)

    router.route '/players/:player_id'
        .get (req, res) ->
            Player.findById req.params.player_id, (error, player) ->
                if error
                    res.send(error)

                res.json(player)

        .put (req, res) ->
            Player.findById req.params.player_id, (error, player) ->
                if error
                    res.send(error)

                player.name = req.body.name
                player.lastname = req.body.lastname
                player.born_date = req.body.born_date
                player.responsable_id = req.body.responsable_id

                player.save (error) ->
                    if error
                        res.send(error)

                    res.json({ message: 'Player Updated!'})

        .delete (req, res) ->
            Player.remove { _id: req.params.player_id }, (error, player) ->
                if error
                    res.send(error)

                res.json({ message: 'Player Successfully deleted!'})
