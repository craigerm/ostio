config = {api: {}}

production = no

config.api.root = if production
  'http://quiet-brook-7460.herokuapp.com'
else
  'http://localhost:3000'

config.api.versionRoot = config.api.root + '/v1'

module.exports = config
