ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")


class ScreenProjectsMenu_1067x584 extends ScreenBase
    constructor: (options) ->
        super

        @parent_screen = options.parent_screen || {}

        @afterBackButtonClicked = null

        if @parent_screen
            @mainLayer.superLayer = @parent_screen.mainLayer
            @mainLayer.placeBehind @parent_screen.topBarLayer

        @mainLayer.backgroundColor = 'white'
    

module.exports = ScreenProjectsMenu_1067x584