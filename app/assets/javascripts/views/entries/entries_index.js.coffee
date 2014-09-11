class ThaiWords.Views.EntriesIndex extends Backbone.View

  model: ThaiWords.Views.Entry

  template: JST['entries/index']

  className: 'entries-index'

  initialize: ->
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @appendEntry)

  events:
    'submit #new_entry': 'createEntry'

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  createEntry: (e) ->
    e.preventDefault()
    attr = thai: $('#new_entry_thai').val(), english: $('#new_entry_english').val()
    @collection.create attr,
      wait: true
      success: @resetForm

  appendEntry: (entry) =>
    view = new ThaiWords.Views.Entry( model: entry )
    @$('#entries').append(view.render().el)

  resetForm: ->
    $('#new_entry').trigger('reset')
