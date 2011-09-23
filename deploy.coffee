airbrake = require('airbrake').createClient(process.env['AIRBRAKE_KEY'])

deployment =
  rev: process.env['REVISION'],
  repo: process.env['REPO'],
  env: process.env['TO'],
  user: process.env['USER']
  
airbrake.trackDeployment deployment, (err, params) ->
  throw err if err?
  console.log('Tracked deployment of %s to %s', params.rev, params.env)
