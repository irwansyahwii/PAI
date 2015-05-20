IntroLayerBase = require("./IntroLayerBase")

curvemove = 'cubic-bezier(0.4, 0, 0.2, 1)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'

BG_IMAGE_NAME = "images/Intro-1-BG.png"
BG_IMAGE_TEMPLATE_NAME = "images/Intro-1-Template.png"

class Intro1LayerWithAnimation_1024_614 extends IntroLayerBase
    constructor: (options) ->
        options = options || {}

        options.BGImage = BG_IMAGE_NAME
        options.backgroundColor = 'black'

        super(options)
        
        
        # @BGLayer.midX = 10

        @is_start = true

    show: () =>
        super
        @mainLayer.center()
        

    play: () =>
        delayValue = 2
        if @is_start
            delayValue = 0

        Utils.delay delayValue, =>
            @is_start = false
            @show()

            @BGLayer.image = BG_IMAGE_NAME
            @BGLayer.width = 50
            @BGLayer.height = 50

            @BGLayer.borderRadius = '50%'
            @BGLayer.y = 0
            @BGLayer.x = 0
            

            gocenter = @BGLayer.animate
                properties:
                    midX: @mainLayer.width / 2 - (@BGLayer.width / 2)
                    midY: @mainLayer.height / 2 - (@BGLayer.height / 2)
                    
                curve: "spring-dho"
                curveOptions:
                    stiffness: 200
                    damping: 10
                    mass: 1
                    velocity: 0
                time: 4

            gocenter.on "end", =>                
                @scaleOut()

    scaleOut: () =>
        scaleOutAnim = @BGLayer.animate
            properties:                
                midX: @mainLayer.width / 2
                midY: @mainLayer.height / 2
                width: @mainLayer.width + 150
                height: @mainLayer.width + 150
            curve: curvein

        scaleOutAnim.on 'end', =>
            @scaleIn()
            
    scaleIn: () =>

        # BGLayer2 = new Layer
        #     image: @BGLayer.image
        #     width: @BGLayer.width
        #     height: @BGLayer.height

        # @BGLayer.opacity = 0

        # BGLayer2.center()

        scaleInAnim = @BGLayer.animate
            properties:                             
                borderRadius: 0   
                midX: 510
                midY: 299                
                width: @mainLayer.height
                height: @mainLayer.height
            curve: curvein

        scaleInAnim.on 'end', =>
            # @BGLayer.destroy()
            @fullDisplayBG()

    fullDisplayBG: () =>
        @BGLayer2 = new Layer
            image: BG_IMAGE_TEMPLATE_NAME
            width: @mainLayer.width
            height: @mainLayer.height
            opacity: 0

        @BGLayer2.superLayer = @mainLayer

        @BGLayer2.center()        

        fadeinAnim = @BGLayer2.animate
            properties:
                opacity: 1
            curve: curveout

        fadeinAnim.on "end", =>
            @BGLayer.destroy()
            @BGLayer = @BGLayer2
            Utils.delay 5, =>
                @onPlayEnds()

    hideWithTransition: () =>
        @mainLayer.animate
            properties:
                x: @mainLayer.width + 10
            curve: curvemove

    

module.exports = Intro1LayerWithAnimation_1024_614