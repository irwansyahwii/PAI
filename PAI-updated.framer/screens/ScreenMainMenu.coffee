ScreenBase = require("./ScreenBase")

class ScreenMainMenu extends ScreenBase
    constructor: () ->
        super

        @layer = new Layer            
            backgroundColor: 'black'
            width: @width
            height: @height

        @layerProfile = new Layer
            backgroundColor: 'red'
            x: 0
            y: 0
            width: @width / 2
            height: @height / 2

        @layerProfile.superLayer = @layer

        @layerProjects = new Layer
            backgroundColor: 'green'
            x: @layerProfile.width
            y: 0
            width: @width - @layerProfile.width
            height: @height - @layerProfile.height

        @layerProjects.superLayer = @layer

        @layerPersonnel = new Layer
            backgroundColor: 'blue'
            x: 0
            y: @layerProfile.height
            width: @layerProfile.width
            height: @layerProfile.height

        @layerPersonnel.superLayer = @layer

        @layerContact = new Layer
            backgroundColor: 'yellow'
            x: @layerProjects.width
            y: @layerProjects.height
            width: @layerProjects.width
            height: @layerProjects.height

        @layerContact.superLayer = @layer

    init: =>
        @layer.center()

    play: () =>
        

module.exports = ScreenMainMenu