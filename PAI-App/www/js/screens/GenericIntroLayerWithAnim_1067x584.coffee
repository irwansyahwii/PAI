IntroLayerBase = require("./IntroLayerBase")

class GenericIntroLayerWithAnim_1067x584 extends IntroLayerBase
    constructor: (options) ->
        @options = options || {}

        @options.BGImage = @options.imageInfo.background.image_name

        super(@options)        

        @is_start = true

        @backgroundLayer = @BGLayer
        @backgroundLayer.width = @options.imageInfo.background.width
        @backgroundLayer.height = @options.imageInfo.background.height

        @captionLayer = new Layer
            image: @options.imageInfo.caption.image_name
            width: @options.imageInfo.caption.width
            height: @options.imageInfo.caption.height
            x: @options.imageInfo.caption.x
            y: @options.imageInfo.caption.y

        @captionLayer.superLayer = @mainLayer

        @text1Layer = new Layer
            image: @options.imageInfo.text1.image_name
            width: @options.imageInfo.text1.width
            height: @options.imageInfo.text1.height
            x: @options.imageInfo.text1.x
            y: @options.imageInfo.text1.y

        @text1Layer.superLayer = @mainLayer

    init: () =>
        super

        @text1Layer.states.add
            hidden:
                opacity: 0
            shown:
                opacity: 1

                

        @backgroundLayer.states.add
            first:
                x: @options.imageInfo.background.first.x
                y: @options.imageInfo.background.first.y
            bottom:
                x: @options.imageInfo.background.bottom.x
                y: @options.imageInfo.background.bottom.y
            center:
                x: @options.imageInfo.background.center.x
                y: @options.imageInfo.background.center.y

        
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
                    @hideWithTransition()
                    Utils.delay 2.5, =>
                        @onPlayEnds()

    hideAllInstantly: () =>
        @captionLayer.states.switchInstant("hidden")
        @backgroundLayer.states.switchInstant('first')
        
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

module.exports = GenericIntroLayerWithAnim_1067x584