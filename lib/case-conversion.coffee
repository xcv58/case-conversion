{CompositeDisposable} = require 'atom'

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
    @replaceSelectedText (text) -> text.charAt(0).toUpperCase() + text.slice(1).toLowerCase()

  replaceSelectedText: (fn) ->
    for selection in atom.workspace.getActivePaneItem().getSelections()
      if selection.isEmpty()
        selection.selectRight()
        selection.selectWord()
      text = selection.getText()
      console.log text
      selection.insertText fn text
