window.ThaiWords =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Helpers: {}
  initialize: ->
    new ThaiWords.Routers.Entries
    Backbone.history.start(pushState: true)

$(document).ready ->
  ThaiWords.initialize()
