class ThaiWords.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  initialize: ->
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @appendEntry)

  events:
    'submit #new_entry': 'createEntry'

  createEntry: (e) ->
    e.preventDefault()
    attr = thai: $('#new_entry_thai').val(), english: $('#new_entry_english').val()
    @collection.create attr

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  appendEntry: (entry) =>
    view = new ThaiWords.Views.Entry( model: entry )
    @$('#entries').append(view.render().el)
