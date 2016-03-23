express = require 'express'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
_ = require 'lodash'

# Create the application
app = do express

# Add Middleware necessary for REST API's
app.use bodyParser.urlencoded({extended: true})
app.use bodyParser.json()
app.use methodOverride('X-HTTP-Method-Override')

# CORS Support
app.use (req, res, next) ->
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE')
    res.header('Access-Control-Allow-Headers', 'Content-Type')
    do next

app.use(
    '/hello'
    (req, res, next) ->
        res.send 'Hello World!' 
        do next
)

# Connect to MongoDB
mongoose.connect 'mongodb://localhost/meanapp'
mongoose.connection.once(
    'open' 
    () -> 
        # Load the models
        app.models = require './models/index'

        # Load the routes
        routes = require './routes'
        _.each(
            routes
            (controller, route) ->
                app.use(route, controller(app, route))
        )

        app.listen 3000
        console.log 'Listening on port 3000...' 
)