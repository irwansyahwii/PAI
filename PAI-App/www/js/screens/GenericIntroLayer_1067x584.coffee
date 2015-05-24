IntroLayerBase = require("./IntroLayerBase")

class GenericIntroLayer_1067x584 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        super(options)        

        @is_start = true

    play : () =>
        delayValue = 3

        Utils.delay delayValue, =>
            @showWithTransition()
            Utils.delay 7, =>
                @onPlayEnds()


module.exports = GenericIntroLayer_1067x584    