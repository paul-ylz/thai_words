class ThaiWords.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  initialize: ->
    @listenTo(@collection, 'reset', @render)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  appendEntry: (entry) =>
    view = new ThaiWords.Views.Entry( model: entry )
    @$('#entries').append(view.render().el)
