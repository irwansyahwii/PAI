ScreenBase = require("./ScreenBase")

class ScreenMainMenu extends ScreenBase
    constructor: () ->
        super

        @layer = new Layer            
            backgroundColor: 'red'
            width: @width
            height: @height

    init: =>
        @layer.center()

    play: () =>
        

module.exports = ScreenMainMenu