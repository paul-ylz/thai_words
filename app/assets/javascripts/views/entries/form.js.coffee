class ThaiWords.Views.Form extends Backbone.View

  template: JST['entries/form']

  render: ->
    $(@el).html @template()
    this

  events:
    'keypress #translator': 'mapKeyToThai'

  mapKeyToThai: (e) ->
    switch e.which
      when 113
        char = 'ๆ'
        break
      when 119
        char = 'ไ'
        break
      when 101
        char = 'ำ'
        break
      when 114
        char = 'พ'
        break
      when 116
        char = 'ะ'
        break
      when 121
        char = 'ั'
        break
      when 117
        char = 'ี'
        break
      when 105
        char = 'ร'
        break
      when 111
        char = 'น'
        break
      when 112
        char = 'ย'
        break
      when 91
        char = 'บ'
        break
      when 93
        char = 'ล'
        break
      when 92
        char = 'ฃ'
        break
    @appendToField char

  appendToField: (char) ->
    value = $('#new_entry_thai').val()
    value += char
    $('#new_entry_thai').val value
