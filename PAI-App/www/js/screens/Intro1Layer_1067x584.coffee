IntroLayerBase = require("./IntroLayerBase")

BG_IMAGE_NAME = "images/Intro-1-Template.png"

class Intro1Layer_1067x584 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = BG_IMAGE_NAME

        super(options)        

        @is_start = true


    play : () =>
        delayValue = 3
        if @is_start
            delayValue = 0

        Utils.delay delayValue, =>
            if @is_start
                @show()
            else
                @showWithTransition()
            @is_start = false
            

            Utils.delay 7, =>
                @onPlayEnds()            


module.exports = Intro1Layer_1067x584