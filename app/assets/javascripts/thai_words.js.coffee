window.ThaiWords =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new ThaiWords.Routers.Entries
    Backbone.history.start(pushState: true)

$(document).ready ->
  ThaiWords.initialize()
