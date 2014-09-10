class ThaiWords.Views.Entry extends Backbone.View

  template: JST['entries/entry']

  tagName: 'tr'

  events:
    'click .destroy': 'destroy'
    # 'dblclick': 'edit'
    'submit': 'update'

  render: ->
    $(@el).html @template( entry: @model )
    this

  destroy: (e) ->
    @model.destroy
      success: => @remove()

  edit: (e) ->
    key = e.target.className
    console.log key
    $(e.target).html('<form><input type="text" data="' + key + '"/><input type="submit"/></form>')


  update: (e) ->
    e.preventDefault()
    key = @$(e.target).children()[0].id
    value = @$(e.target).children()[0].value
    console.log key
    console.log value
    # ^^ There must be a nicer way to get the value out of there
    # @model.save @edit_field, value,
      # success: -> $('#edit_entry').remove()
