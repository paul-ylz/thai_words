class ThaiWords.Views.EntriesIndex extends Backbone.View

  model: ThaiWords.Views.Entry

  template: JST['entries/index']

  className: 'entries-index'

  initialize: ->
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @appendEntry)
    @listenTo(@collection, 'destroy', @flashDestroyMessage)

  events:
    'click #clear_status_bar': 'clearStatusBar'

  render: ->
    $(@el).html @template()
    form = new ThaiWords.Views.Form( collection: @collection )
    @$('#form').html form.render().el
    @collection.each @appendEntry
    this

  appendEntry: (entry) =>
    view = new ThaiWords.Views.Entry( model: entry )
    @$('#entries').append(view.render().el)
    @$('#status_bar_message').html('Entry created for ' + entry.get('thai') + '; ' + entry.get('english'))

  flashDestroyMessage: (entry) ->
    @$('#status_bar_message').html('Destroyed ' + entry.get('thai') + '; ' + entry.get('english'))

  clearStatusBar: (e) ->
    @$('#status_bar_message').empty()
