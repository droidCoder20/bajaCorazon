Responsable = require '../models/responsable'

module.exports = (router) ->
    router.route '/responsable'
        .post (req,res) ->
            responsable = new Responsable()
            responsable.name = req.body.name
            responsable.lastname = req.body.lastname
            responsable.address = req.body.address
            responsable.email = req.body.email
            responsable.phone = req.body.phone
            responsable.cellphone = req.body.cellphone

            responsable.save (error) ->
                if error
                    res.send(error)

                res.json({ message: 'Responsable Created' })

        .get (req, res) ->
            Responsable.find (error, responsables) ->
                if error
                    res.send(error)

                res.json(responsables)

    router.route '/responsable/:responsable_id'
        .get (req, res) ->
            Responsable.findById req.params.responsable_id, (error, responsable) ->
                if error
                    res.send(error)

                res.json(responsable)

        .put (req, res) ->
            Responsable.findById req.params.responsable_id, (error, responsable) ->
                if error
                    res.send(error)

                responsable.name = req.body.name
                responsable.lastname = req.body.lastname
                responsable.address = req.body.address
                responsable.email = req.body.email
                responsable.phone = req.body.phone
                responsable.cellphone = req.body.cellphone

                responsable.save (error) ->
                    if error
                        res.send(error)

                    res.json({ message: 'Responsable Updated!'})

        .delete (req, res) ->
            Responsable.remove { _id: req.params.responsable_id }, (error, responsable) ->
                if error
                    res.send(error)

                res.json({ message: 'Responsable Successfully deleted!'})
