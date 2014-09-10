class ThaiWords.Views.Entry extends Backbone.View

  template: JST['entries/entry']

  tagName: 'tr'

  className: 'entry'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  events:
    'click .destroy': 'destroy'
    'click .word'   : 'edit'
    'keypress .edit': 'updateOnEnter'

  render: ->
    $(@el).html @template( entry: @model )
    this

  destroy: (e) ->
    @model.destroy()

  edit: (e) ->
    $(e.target).parent('td').addClass('editing')

  updateOnEnter: (e) ->
    if e.keyCode is 13
      language = $(e.target).data('lang')
      word     = $(e.target).val()
      @model.save language, word,
        success: =>
          $(e.target).parent('td').removeClass('editing')
