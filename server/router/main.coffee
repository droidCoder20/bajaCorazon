module.exports = (router) ->
    router.get '/', (req,res) ->
        res.json({ message: "Welcome to my API" })
