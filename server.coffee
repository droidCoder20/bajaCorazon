## Express Middlewares
bodyParser  = require 'body-parser'
express     = require 'express'
mongoose    = require 'mongoose'
router      = express.Router()
app         = express()

## SET PORT
port = process.env.PORT || 8080

## DB STUFF
mongoose.connect 'mongodb://admin:root123@ds039431.mongolab.com:39431/bajacorazondb'

## USE
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()
app.use('/api', router)

## Require routes
router.use (req,res,next) ->
    console.log "Something is happening"
    next()
require('./server/router/main')(router)
require('./server/router/attendance')(router)
require('./server/router/player')(router)
require('./server/router/responsable')(router)
require('./server/router/user')(router)


app.listen(port)
console.log "Magic Happens at: #{port}"
