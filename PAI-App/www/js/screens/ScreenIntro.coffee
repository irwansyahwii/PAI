ScreenBase = require("./ScreenBase")
Intro1Layer = require("./Intro1_1024_614")

class Screen extends ScreenBase
    constructor: () ->

        super

        @onExit = null

        @layer = new Layer            
            backgroundColor: 'black'
            width: @width
            height: @height

        @fadeInAnimation = new Animation
            time: 3
            properties:
                
                opacity: 1

        @fadeOutAnimation = new Animation
            time: 3
            properties:
                
                opacity: 0


        @imageLayers = []

        @currentImageIndex = 0;

        @isFirstTimePlayed = true
        @lastTimeoutId = -1

    init: =>

        images = [
            # '/images/Intro 1.png'
            '/images/Intro 2.png'
            , '/images/Intro 3.png'
            , '/images/Intro 4.png'
        ]

        intro1 = new Intro1Layer
                width: @width
                height: @height
                opacity: 0
                superLayer: @layer

        intro1.init()        

        @imageLayers.push(intro1)

        for image in images            
            @imageLayer = new Layer
                image: image
                width: @width
                height: @height
                opacity: 0

            @imageLayer.superLayer = @layer

            @imageLayers.push(@imageLayer)

        @imageLayers[0].opacity = 1

        @layer.states.add
            hidden: 
                opacity: 0
        @layer.states.add
            visible: 
                opacity: 1

        @layer.center()

        @layer.on Events.Click, @onMainLayerClicked

        @fadeInAnimation.on Events.AnimationEnd, () =>
            # if @fadeInAnimation.options.layer.play
            #     @fadeInAnimation.options.layer.play()

    destroy: () =>

        # for layer in @imageLayers
        #     layer.destroy()
        

        if @lastTimeoutId > -1            
            clearTimeout(@lastTimeoutId)
            @lastTimeoutId = -1
        @layer.destroy()

        @layer = null
        if(@onExit)
            @onExit()
            @onExit = null

    onMainLayerClicked: (event, layer) =>
        @destroy()

    getNextImageIndex: (currentImageIndex) =>
        nextImageIndex = currentImageIndex + 1
        if nextImageIndex >= @imageLayers.length
            nextImageIndex = 0

        nextImageIndex

    play: =>

        console.log("ScreenIntro.play() called")
        
        @layer.states.switch("visible")


        if not @isFirstTimePlayed

            fadeInIndex =@getNextImageIndex(@currentImageIndex)

            @fadeInAnimation.options.layer = @imageLayers[fadeInIndex]

            @fadeOutAnimation.options.layer = @imageLayers[@currentImageIndex]

            @fadeOutAnimation.start()
            @fadeInAnimation.start()



            @lastTimeoutId = setTimeout(() =>
                    @currentImageIndex += 1
                    if @currentImageIndex >= @imageLayers.length
                        @currentImageIndex = 0
                    @play()
                , 7000)



            
        else
            @imageLayers[0].onAnimationEnd = () =>
                setTimeout(() =>
                        @play()
                    , 2000)
                
            @imageLayers[0].play()
            @isFirstTimePlayed = false
            


    center: =>
        @layer.center()

module.exports = Screen