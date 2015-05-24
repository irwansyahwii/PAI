IntroLayerBase = require("./IntroLayerBase")

BG_IMAGE_NAME = "images/Intro-1-Template.jpg"

class Intro1Layer_800x480 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = BG_IMAGE_NAME

        super(options)

        @is_start = true

    play: () =>
        if(@is_start)
            @is_start = false
            @show()

            super
        else
            super




module.exports = Intro1Layer_800x480