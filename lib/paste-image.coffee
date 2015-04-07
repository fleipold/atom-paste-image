PasteImageView = require './paste-image-view'
{CompositeDisposable} = require 'atom'
ClipBoard = require 'clipboard'


module.exports = PasteImage =
  pasteImageView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @pasteImageView = new PasteImageView(state.pasteImageViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @pasteImageView, visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'paste-image:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @pasteImageView.destroy()

  serialize: ->
    pasteImageViewState: @pasteImageView.serialize()

  toggle: ->
    console.log 'PasteImage was toggled!'
    editor = atom.workspace.activePaneItem
    # editor.insertText('What is going on here?')
    # var image = clipboard.readImage()
    # editor.insertText(editor.getPath())


    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
