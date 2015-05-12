ScreenBase = require("./ScreenBase")
Intro1Layer = require("./Intro1Layer")

class Screen extends ScreenBase
    constructor: () ->

        super

        @onExit = null

        @layer = new Layer            
            
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
            # '/imported/PAI-updated/images/Intro 1.png'
            '/imported/PAI-updated/images/Intro 2.png'
            , '/imported/PAI-updated/images/Intro 3.png'
            , '/imported/PAI-updated/images/Intro 4.png'
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
            if @fadeInAnimation.options.layer.play
                @fadeInAnimation.options.layer.play()

    onMainLayerClicked: (event, layer) =>
        if @lastTimeoutId > -1
            clearTimeout(@lastTimeoutId)
        @layer.destroy()
        if(@onExit)
            @onExit()

    getNextImageIndex: (currentImageIndex) =>
        nextImageIndex = currentImageIndex + 1
        if nextImageIndex >= @imageLayers.length
            nextImageIndex = 0

        nextImageIndex

    play: =>
        
        @layer.states.switch("visible")


        if not @isFirstTimePlayed
            return

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
                , 5000)



            
        else
            @imageLayers[0].play()
            @isFirstTimePlayed = false
            setTimeout(() =>                    
                    @play()
                , 3000)


    center: =>
        @layer.center()

module.exports = Screen