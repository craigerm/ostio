View = require 'views/base/view'
template = require 'views/templates/repo'

module.exports = class RepoView extends View
  className: 'user-repo'
  tagName: 'li'
  template: template
