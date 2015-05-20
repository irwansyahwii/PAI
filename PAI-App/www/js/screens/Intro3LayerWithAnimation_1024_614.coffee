IntroLayerBase = require("./IntroLayerBase")

curvemove = 'cubic-bezier(0.4, 0, 0.2, 1)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'


class Intro3LayerWithAnimation_1024_614 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.backgroundColor = "black"
        options.BGImage = "images/Intro-3-Template.png"

        super(options)

    play: =>
        @show()
        @mainLayer.y = -@mainLayer.height
        playAnim = @mainLayer.animate
            properties:
                y: 0

        playAnim.on "end", =>
            Utils.delay 5, =>
                @onPlayEnds()            

    hideWithTransition: () =>
        @mainLayer.animate
            properties:
                y: -@mainLayer.height 
            curve: curvemove



module.exports = Intro3LayerWithAnimation_1024_614