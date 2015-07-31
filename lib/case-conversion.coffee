Capitalize = require 'capitalize'

module.exports = Capitalized =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'case-conversion:capitalize': => @capitalize()
    atom.commands.add 'atom-workspace', 'case-conversion:upper': => @upper()
    atom.commands.add 'atom-workspace', 'case-conversion:lower': => @lower()

  upper: ->
    @replaceSelectedText (text) -> text.toUpperCase()

  lower: ->
    @replaceSelectedText (text) -> text.toLowerCase()

  capitalize: ->
    @replaceSelectedText (text) -> Capitalize.words(text)

  replaceSelectedText: (fn) ->
    for selection in atom.workspace.getActivePaneItem().getSelections()
      if selection.isEmpty()
        selection.selectRight()
        selection.selectWord()
      text = selection.getText()
      selection.insertText fn text
