class ThaiWords.Views.Form extends Backbone.View

  template: JST['entries/form']

  render: ->
    $(@el).html @template()
    this

  events:
    'keypress #translator': 'mapKeyToThai'
    'keydown #translator' : 'handleSpecialKeys'
    'keydown #new_entry_english': 'tabToTranslator'
    'click #new_entry_thai': 'toggleThaiField'
    'focus #new_entry_english': 'toggleThaiField'

  toggleThaiField: (e) ->
    field = $('#new_entry_thai')
    if field.hasClass('glow')
      field.removeClass('glow')
    else
      field.addClass('glow')
      @$('#translator').trigger('focus')

  handleSpecialKeys: (e) ->
    keyCode = e.keyCode
    switch keyCode
      when 9
        @handleTab(e)
        break
      when 8
        @emulateBackspace(e)
        break
      when 13
        # User hit enter
        @$('#new_entry').trigger('submit')
        break

  handleTab: (e) ->
    e.preventDefault()
    $('#new_entry_english').trigger('focus')

  tabToTranslator: (e) ->
    if e.keyCode == 9
      e.preventDefault()
      $('#translator').trigger('focus')

  emulateBackspace: (e) ->
    $('#new_entry_thai').val( $('#new_entry_thai').val().slice(0, -1) )

  mapKeyToThai: (e) ->
    uniCode = e.charCode
    char    = @keyMap[uniCode]
    @appendToField char if char

  appendToField: (char) ->
    value = $('#new_entry_thai').val()
    value += char
    $('#new_entry_thai').val value

  keyMap:
    32: ' '
    96: '-'
    49: 'ๅ'
    50: '/'
    51: '_'
    52: 'ภ'
    53: 'ถ'
    54: 'ุ'
    55: 'ึ'
    56: 'ค'
    57: 'ต'
    48: 'จ'
    45: 'ข'
    61: 'ช'
    113: 'ๆ'
    119: 'ไ'
    101: 'ำ'
    114: 'พ'
    116: 'ะ'
    121: 'ั'
    117: 'ี'
    105: 'ร'
    111: 'น'
    112: 'ย'
    91: 'บ'
    93: 'ล'
    92: 'ฃ'
    97: 'ฟ'
    115: 'ห'
    100: 'ก'
    102: 'ด'
    103: 'เ'
    104: '้'
    106: '่'
    107: 'า'
    108: 'ส'
    59: 'ว'
    39: 'ง'
    122: 'ผ'
    120: 'ป'
    99: 'แ'
    118: 'อ'
    98: 'ิ'
    110: 'ื'
    109: 'ท'
    44: 'ม'
    46: 'ใ'
    47: 'ฝ'
    126: '%'
    33: '+'
    64: '๑'
    35: '๒'
    36: '๓'
    37: '๔'
    94: 'ู'
    38: '฿'
    42: '๕'
    40: '๖'
    41: '๗'
    95: '๘'
    43: '๙'
    81: '๐'
    87: '”'
    69: 'ฎ'
    82: 'ฑ'
    84: 'ธ'
    89: 'ํ'
    85: '๊'
    73: 'ณ'
    79: 'ฯ'
    80: 'ญ'
    123: 'ฐ'
    125: ','
    124: 'ฅ'
    65: 'ฤ'
    83: 'ฆ'
    68: 'ฏ'
    70: 'โ'
    71: 'ฌ'
    72: '็'
    74: '๋'
    75: 'ษ'
    76: 'ศ'
    58: 'ซ'
    34: '.'
    90: '('
    88: ')'
    67: 'ฉ'
    86: 'ฮ'
    66: 'ฺ'
    78: '์'
    77: '?'
    60: 'ฒ'
    62: 'ฬ'
    63: 'ฦ'
