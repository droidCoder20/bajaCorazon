#DB VARS
User        = require './server/models/user'
Player      = require './server/models/player'
Responsable = require './server/models/responsable'
Attendance  = require './server/models/attendance'
#Express Middlewares
bodyParser  = require 'body-parser'
express     = require 'express'
mongoose    = require 'mongoose'
router      = express.Router()
app         = express()

## USE
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()
app.use('/api', router)

## SET PORT
port = process.env.PORT || 8080

## DB STUFF
mongoose.connect 'mongodb://admin:root123@ds039431.mongolab.com:39431/bajacorazondb'

console.log User
console.log Player 
console.log Responsable
console.log Attendance

router.use (req,res,next) ->
    console.log "Something is happening"
    next()
    
router.get '/', (req,res) ->
    res.json({ message: "Welcome to my API" })

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
            
            res.json({ message: 'Bear Created' })
                
app.listen(port)
console.log "Magic Happens at: #{port}"