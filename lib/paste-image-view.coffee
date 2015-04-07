{View} = require 'space-pen'
module.exports =
class PasteImageView extends View
    @content: ->
        @div tabIndex: -1, class: 'paste-image', =>
            @span 'Filename:'
            @input outlet:  'name-input'
            @button 'paste', click: 'paste'

    paste: (event, element)->
        console.log('nowt')


    # constructor: (serializedState) ->
    #   # Create root element
    #   @element = document.createElement('div')
    #   @element.classList.add('paste-image')
    #
    #   # Create message element
    #   message = document.createElement('div')
    #   message.textContent = "The PasteImage package is Alive! It's ALIVE!"
    #   message.classList.add('message')
    #   @element.appendChild(message)

    # Returns an object that can be retrieved when package is activated

    serialize: ->

    # Tear down any state and detach
    destroy: ->
        @element.remove()
