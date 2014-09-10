class ThaiWords.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new ThaiWords.Collections.Entries
    @collection.reset($('#container').data('entries'))

  index: ->
    view = new ThaiWords.Views.EntriesIndex( collection: @collection )
    $('#container').html(view.render().el)
