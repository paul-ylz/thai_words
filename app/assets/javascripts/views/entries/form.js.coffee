class ThaiWords.Views.Form extends Backbone.View

  template: JST['entries/form']

  render: ->
    $(@el).html @template()
    this
