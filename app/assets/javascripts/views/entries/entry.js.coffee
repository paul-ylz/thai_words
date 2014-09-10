class ThaiWords.Views.Entry extends Backbone.View

  template: JST['entries/entry']

  tagName: 'tr'

  events:
    'click .destroy': 'destroy'

  render: ->
    $(@el).html @template( entry: @model )
    this

  destroy: (e) ->
    @model.destroy
      success: => @remove()
