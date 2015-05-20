IntroLayerBase = require("./IntroLayerBase")

curvemove = 'cubic-bezier(0.4, 0, 0.2, 1)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'


class Intro2LayerWithAnimation_1024_614 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = "images/Intro-2-Template.png"
        options.backgroundColor = "black"

        super(options)
        

    play: () =>                        
        @show()
        @mainLayer.x = -@mainLayer.width
        playAnim = @mainLayer.animate
            properties:
                x: 0

        playAnim.on "end", =>
            Utils.delay 5, =>
                @onPlayEnds()            
            

    hideWithTransition: () =>
        @mainLayer.animate
            properties:
                y: @mainLayer.height + 10
            curve: curveout



module.exports = Intro2LayerWithAnimation_1024_614