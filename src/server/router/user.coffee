User = require '../models/user'

module.exports = (router) ->
    router.route '/users'
        .post (req,res) ->
            user = new User()
            user.name = req.body.name
            user.lastname = req.body.lastname
            user.username = req.body.username
            user.email = req.body.email
            user.password = req.body.password

            user.save (error) ->
                if error
                    res.send(error)

                res.json({ message: 'User Created' })

        .get (req, res) ->
            User.find (error, users) ->
                if error
                    res.send(error)

                res.json(users)

    router.route '/users/:user_id'
        .get (req, res) ->
            User.findById req.params.user_id, (error, user) ->
                if error
                    res.send(error)

                res.json(user)

        .put (req, res) ->
            User.findById req.params.user_id, (error, user) ->
                if error
                    res.send(error)

                user.name = req.body.name
                user.lastname = req.body.lastname
                user.username = req.body.username
                user.email = req.body.email
                user.password = req.body.password

                user.save (error) ->
                    if error
                        res.send(error)

                    res.json({ message: 'User Updated!'})

        .delete (req, res) ->
            User.remove { _id: req.params.user_id }, (error, user) ->
                if error
                    res.send(error)

                res.json({ message: 'User Successfully deleted!'})
