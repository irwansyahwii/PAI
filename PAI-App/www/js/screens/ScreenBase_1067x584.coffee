ScreenBase = require("./ScreenBase")

class ScreenBase_1067x584 extends ScreenBase

    @WIDTH: 1067
    @HEIGHT: 584

    constructor: () ->
        @width = ScreenBase_1067x584.WIDTH
        @height = ScreenBase_1067x584.HEIGHT

        @delegate = null

        super

    onBackButtonClicked: () =>
        @hideAllLayers()
        if @afterBackButtonClicked isnt null
            Utils.delay 1, =>
                @afterBackButtonClicked(@)

module.exports = ScreenBase_1067x584
