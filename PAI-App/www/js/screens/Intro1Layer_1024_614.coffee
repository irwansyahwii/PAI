IntroLayerBase = require("./IntroLayerBase")

class Intro1Layer_1024_614 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = "img/Intro-1-BG.png"

        super(options)

        @is_start = true

    play: () =>
        if(@is_start)
            @is_start = false
            @show()

            super
        else
            super




module.exports = Intro1Layer_1024_614