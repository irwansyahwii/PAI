IntroLayerBase = require("./IntroLayerBase")

BG_IMAGE_NAME = "images/Intro1-Background.png"

class Intro1Layer_1067x584 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = BG_IMAGE_NAME

        super(options)        

        @is_start = true

        @backgroundLayer = @BGLayer
        @backgroundLayer.width = 1072
        @backgroundLayer.height = 1584

        @captionLayer = new Layer
            image: 'images/Intro1-Caption.png'
            width: 482
            height: 46
            x: 37
            y: 336

        @captionLayer.superLayer = @mainLayer

        @text1Layer = new Layer
            image: 'images/Intro1-Text1.png'
            width: 276
            height: 92
            x: 499
            y: 418

        @text1Layer.superLayer = @mainLayer

        @text2Layer = new Layer
            image: 'images/Intro1-Text2.png'
            width: 224
            height: 91
            x: 819
            y: 480

        @text2Layer.superLayer = @mainLayer

    init: () =>
        super

        @text1Layer.states.add
            hidden:
                opacity: 0
            shown:
                opacity: 1

        

        @text2Layer.states.add
            hidden:
                opacity: 0
            shown:
                opacity: 1

        

        @backgroundLayer.states.add
            first:
                x: 0
                y: 0
            bottom:
                x: 0
                y: -1000
            center:
                x:0
                y: -600

        
        @backgroundLayer.on Events.StateDidSwitch, @onBackgroundLayerStateDidSwitch

        @captionLayer.states.add
            hidden:
                opacity: 0
            shown:
                opacity: 1

        @hideAllInstantly()

    onBackgroundLayerStateDidSwitch: (prevState, stateName) =>
        
        
        if prevState is "first" and stateName is "bottom"
            # console.log "okay"            
            # @playTextAnimation()
            @backgroundLayer.states.switch("center")

        if prevState is "bottom" and stateName is "center"
            @playTextAnimation()

    playTextAnimation: () =>
        captionAnim = @captionLayer.animate
            properties:
                opacity: 1
            time: 2

        captionAnim.on "end", =>
            text1anim = @text1Layer.animate
                properties:
                    opacity: 1
                time: 2

            text1anim.on "end", =>
                Utils.delay 2, =>

                    text2anim = @text2Layer.animate
                        properties:
                            opacity: 1
                        time: 2

                    text2anim.on "end", =>
                        Utils.delay 2, =>
                            @hideWithTransition()
                            Utils.delay 2, =>
                                @onPlayEnds()

    hideAllInstantly: () =>
        @captionLayer.states.switchInstant("hidden")
        @backgroundLayer.states.switchInstant('first')
        @text2Layer.states.switchInstant("hidden")
        @text1Layer.states.switchInstant("hidden")


    play : () =>        
        delayValue = 3
        if @is_start
            delayValue = 0

        Utils.delay delayValue, =>
            @hideAllInstantly()
            @show()
            @backgroundLayer.states.switch("bottom")
            # if @is_start
            #     @show()
            # else
            #     @showWithTransition()
            # @is_start = false
            

            # Utils.delay 7, =>
            #     @onPlayEnds()            


module.exports = Intro1Layer_1067x584