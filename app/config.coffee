config = {api: {}}

production = yes

config.api.root = if production
  'http://quiet-brook-7460.herokuapp.com'
else
  'http://dev.ost.io:3000'

config.api.versionRoot = config.api.root + '/v1'

module.exports = config
