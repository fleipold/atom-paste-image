{View} = require 'space-pen'
module.exports =
class PasteImageView extends View


    @content: ->
        @div tabIndex: -1, class: 'paste-image', =>
            @span 'Filename:'
            @input outlet:  'nameField'
            @button 'paste', click: 'paste'

    paste: (event, element)->
        console.log('nowt')
        @action()

    initialize: (params) ->
        @action = params.action

    name: ->
        @nameField.val()

    serialize: ->

    # Tear down any state and detach
    destroy: ->
        @element.remove()
