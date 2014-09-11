class ThaiWords.Views.EntriesIndex extends Backbone.View

  model: ThaiWords.Views.Entry

  template: JST['entries/index']

  className: 'entries-index'

  initialize: ->
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @appendEntry)

  events:
    'submit #new_entry'      : 'createEntry'
    'click #clear_status_bar': 'clearStatusBar'

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  createEntry: (e) ->
    e.preventDefault()
    attr = thai: @$('#new_entry_thai').val(), english: @$('#new_entry_english').val()
    @collection.create attr,
      wait: true
      success: (model, response, options) =>
        @$('#new_entry').trigger('reset')
        @$('#status_bar_message')
          .html('Entry created for ' + model.get('thai') + ', ' + model.get('english'))

  appendEntry: (entry) =>
    view = new ThaiWords.Views.Entry( model: entry )
    @$('#entries').append(view.render().el)

  clearStatusBar: (e) ->
    @$('#status_bar_message').empty()

  handleCreateSuccess: ->
