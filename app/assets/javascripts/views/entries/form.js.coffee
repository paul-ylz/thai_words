class ThaiWords.Views.Form extends Backbone.View

  template: JST['entries/form']

  render: ->
    $(@el).html @template()
    this

  events:
    # use keypress event to get character codes for translation
    'keypress #new_entry_thai'  : 'catchAndReplace'
    'submit #new_entry'         : 'createEntry'
    'reset #new_entry'          : 'resetFocus'
    'keydown #new_entry_english': 'resetFocusIfTab'

  catchAndReplace: (e) ->
    e.preventDefault()
    if e.which == 13
      $(e.target).trigger('submit')
      return
    thaiChar = @keyMap[e.which]
    $(e.target).val($(e.target).val() + thaiChar)

  createEntry: (e) ->
    e.preventDefault()
    attr = thai: @$('#new_entry_thai').val(), english: @$('#new_entry_english').val()
    @collection.create attr,
      success: (model, response, options) =>
        @$('#new_entry').trigger('reset')

  resetFocusIfTab: (e) ->
    if e.keyCode == 9
      e.preventDefault()
      @resetFocus()

  resetFocus: (e) ->
    @$('#new_entry_thai').trigger('focus')

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
