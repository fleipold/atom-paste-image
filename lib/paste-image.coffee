PasteImageView = require './paste-image-view'
fs = require 'fs'
{CompositeDisposable} = require 'atom'
ClipBoard = require 'clipboard'


module.exports = PasteImage =
  pasteImageView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->

    @pasteImageView = new PasteImageView({action: => @doit()})
    console.log('created paste image view')
    @modalPanel = atom.workspace.addModalPanel(item: @pasteImageView, visible: false)


    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'paste-image:pasteImage': => @pasteImage()

  deactivate: ->
    console.log('deactivate')
    @modalPanel.destroy()
    @subscriptions.dispose()
    @pasteImageView.destroy()

  serialize: ->
    pasteImageViewState: @pasteImageView.serialize()

  pasteImage: ->
    @modalPanel.show()




  doit: ->
    console.log 'doit was called with name: '

    name = @pasteImageView.name()
    console.log name
    editor = atom.workspace.activePaneItem
    # editor.insertText('What is going on here?')
    image = ClipBoard.readImage()
    filename = editor.getPath() + "." + name + ".png"

    png = image.toPng()
    fs.writeFileSync(filename, png)

    link = "![#{name}](#{filename})"
    editor.insertText(link)

    @modalPanel.hide()
