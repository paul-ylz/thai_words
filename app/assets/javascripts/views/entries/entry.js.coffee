class ThaiWords.Views.Entry extends Backbone.View

  template: JST['entries/entry']

  tagName: 'tr'

  className: 'entry'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  events:
    'click .destroy'         : 'destroy'
    'click .word'            : 'edit'
    'keypress .edit'         : 'updateOnEnter'
    'blur .edit'             : 'abortEdit'
    'focus input' : -> $('#status_bar_message').html 'Editing'

  render: ->
    $(@el).html @template(entry: @model)
    new TypeThai @$('input[data-lang="thai"]')
    this

  destroy: (e) ->
    @model.destroy
      success: -> $('#new_entry').trigger('reset')

  edit: (e) ->
    @$(e.target).closest('td').addClass('editing')
      .children('input').trigger('focus')


  updateOnEnter: (e) ->
    if e.keyCode is 13
      language = $(e.target).data('lang')
      word     = $(e.target).val()
      @model.save language, word,
        success: (model, response, options) =>
          @$('.editing').removeClass 'editing'
          $('#status_bar_message').html 'Updated'

  abortEdit: (e) ->
    @$('.editing').removeClass 'editing'
    $('#status_bar_message').html 'Edit aborted'
