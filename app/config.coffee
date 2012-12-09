config = {api: {}}

production = yes 

config.api.root = if production
  'http://api-binpub.herokuapp.com'
else
  'http://localhost:3000'

config.api.versionRoot = config.api.root + '/v1'

module.exports = config
