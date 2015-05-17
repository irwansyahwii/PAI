#original 3322,2000
# 269, 658

class Intro1Layer extends Layer



    initLayerWe: () =>
        @onAnimationEnd = null

        @layerWe = new Layer
            image: '/images/Intro-1-We.png'
            x: 82.92
            y: 197.4
            width: 107
            height: 47
            opacity: 0

        @layerWe.originalOriginX = @layerWe.originX
        @layerWe.originalOriginY = @layerWe.originY

        @layerWe.originX = 0
        @layerWe.originY = 0

        @layerWe.scaleX = @width / 3322
        @layerWe.scaleY = @height / 2000

        @layerWe.superLayer = @

        @layerWeAnimationFadeIn = new Animation
            time: 3
            layer: @layerWe
            properties:
                opacity: 1

        @layerWeAnimationRotate = new Animation
            time: 10
            layer: @layerWe
            properties:
                rotation: @layerWe.rotation + 360
            curve: "spring(800,25,0)"
                

        @layerWeAnimationFadeIn.on Events.AnimationStart, @onLayerWeAnimationFadeInStarted
        @layerWeAnimationFadeIn.on Events.AnimationEnd, @onLayerWeAnimationFadeInEnded

        @layerWeAnimationRotate.on Events.AnimationEnd, @onLayerWeAnimationRotateEnded        

    constructor: (options) ->
        super
            image: '/images/Intro-1.png'
            width: options.width
            height: options.height
            opacity: options.opacity

        @superLayer = options.superLayer






    initLayerCreate: () =>

        @layerCreate = new Layer
            image: '/imported/PAI-updated/images/Intro-1-Create.png'
            x: @layerWe.x + @layerWe.width * @layerWe.scaleX 
            y: @layerWe.y 
            
            # width: 0
            # height: 0
            width: 707
            height: 145
            # opacity: 0



        @layerCreate.originX = 0
        @layerCreate.originY = 0
        @layerCreate.superLayer = @
        @layerCreate.scaleX = @layerWe.scaleX
        @layerCreate.scaleY = @layerWe.scaleY


        @layerCreate.x = @layerWe.x + @layerWe.width * @layerWe.scaleX + (80 * @layerCreate.scaleX)
        @layerCreate.y = @layerWe.y + ((@layerWe.height * @layerWe.scaleY) / 2) - (@layerCreate.height * @layerCreate.scaleY) / 2
        @layerCreate.originalWidth = @layerCreate.width
        @layerCreate.originalHeight = @layerCreate.height

        @layerCreate.width = 0
        # @layerCreate.height = 0
        @layerCreate.originX = 1

        @layerCreateSizeAnimation = new Animation
            time: 2
            layer: @layerCreate
            properties:
                # opacity: 1
                originX: 0
                width: @layerCreate.originalWidth
            # curve: "spring(200,25,0)"

                # height: @layerCreate.originalHeight
                # x: @layerCreate.x 

        # @layerCreate.x = 0
        # @layerCreate.y = 0

    onLayerWeAnimationRotateEnded: () =>
        # @layerWe.rotation = 0

    onLayerWeAnimationFadeInStarted: () =>
        console.log "onLayerWeAnimationStarted called"

        # @layerWeAnimationRotate.start()

    onLayerWeAnimationFadeInEnded: () =>
        console.log "onLayerWeAnimationEnded called"
        
        
        @layerCreateSizeAnimation.start()


    initLayerSpace: () =>
        @layerSpace = new Layer
            image: '/images/Intro-1-Space.png'
            x: @layerCreate.x
            y: Screen.height + (Screen.height / 3) 
            width: 250
            height: 49
            opacity: 1

        @layerSpace.superLayer = @
        @layerSpace.scaleX = @layerCreate.scaleX
        @layerSpace.scaleY = @layerCreate.scaleY
        @layerSpace.x = @layerCreate.x + (780 * @layerSpace.scaleX)

        @layerSpace.states.add
            stateOnTopMost: 
                y: 0
            stateMiddle:
                y: @layerCreate.y
            stateLeft:
                x: @layerSpace.x - (350 * @layerSpace.scaleX)
            stateRight:
                x: @layerSpace.x + (350 * @layerSpace.scaleX)
            stateFinal:
                y: @layerCreate.y
                x: @layerCreate.x + (780 * @layerSpace.scaleX)

        @layerSpace.animationEndCounter = 0
        @layerSpace.on Events.StateDidSwitch, (a, stateName) =>
            if stateName isnt 'stateFinal'
                @layerSpace.states.next()
            if stateName is 'stateFinal'
                @layerParagraph1.states.next()
            # if @layerSpace.animationEndCounter >= 2 
            #     return
            # @layerSpace.animationEndCounter += 1
            # @layerSpace.states.next()        

    initLayerParagraph1: () =>
        @layerParagraph1 = new Layer
            image: '/images/Intro-1-Paragraph1.png'
            x: @layerCreate.x + (1600 * @layerWe.scaleX)
            y: @layerCreate.y + (100 * @layerWe.scaleY)
            width: 497
            height: 195
            opacity: 0

        @layerParagraph1.superLayer = @
        
        @layerParagraph1.originX = 0
        @layerParagraph1.originY = 0

        @layerParagraph1.scaleX = @layerWe.scaleX
        @layerParagraph1.scaleY = @layerWe.scaleY

        @layerParagraph1.states.add
            stateFinal:
                opacity: 1

        @layerParagraph1.on Events.StateDidSwitch, (e, stateName) =>            
            if stateName is "stateFinal"
                if @onAnimationEnd
                    @onAnimationEnd()

    init: =>
        @initLayerWe()
        @initLayerCreate()
        @initLayerSpace()
        @initLayerParagraph1()

    play: =>
        console.log("Intro1Layer.play called")
        @layerWeAnimationFadeIn.start()

        setTimeout(() =>
                @layerSpace.states.next()
            , 4000) 
        

        # @layerWeAnimationRotate.start()

module.exports = Intro1Layer