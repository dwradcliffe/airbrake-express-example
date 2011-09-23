require.paths.unshift '.'

express = require 'express'

app = module.exports = express.createServer()

app.configure 'development', ->
  app.use express.errorHandler dumpExceptions: true, showStack: true

app.configure 'production', ->
  airbrake = require('airbrake').createClient(process.env['AIRBRAKE_KEY'])
  app.use airbrake.errorHandler()


app.get '/', (req, res) ->
  res.send 'Hello World.'
  
app.get '/error', (req, res) ->
  throw new Error("This is a test error!")
  

app.listen process.env.PORT || 3030

console.log 'Express server listening on port %d in %s mode', app.address().port, app.settings.env