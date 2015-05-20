class IntroLayerBase extends Layer
    constructor: (options) ->
        super(options)

        superLayer = options.superLayer

        @mainLayer = @

        @mainLayer.width = options.width
        @mainLayer.height = options.height  
        @mainLayer.backgroundColor = options.backgroundColor || 'white'      

        @mainLayer.on Events.StateDidSwitch, @onMainLayerStateDidSwitch
        @mainLayer.on Events.AnimationEnd, @onMainLayerAnimationEnd

        if superLayer
            @mainLayer.superLayer = superLayer

        @mainLayer.states.add 
            hidden: {opacity: 0}
            show: {opacity: 1}
            play: {opacity: 1}



        @mainLayer.states.animationOptions = 
            time: 3

        @BGLayer = new Layer
            image: options.BGImage
            width: @width
            height: @height

        @BGLayer.superLayer = @mainLayer

        @BGLayer.center()

        @onPlayEnds = null

        @currentState = ""
        @isPlayCalled = false

    init: () =>
        @mainLayer.hide()

    onMainLayerAnimationEnd: () =>
        if @currentState is "play"            
            @onPlayEnds()

    onMainLayerStateDidSwitch: (e, stateName) =>
        if stateName is "play"
            @onPlayEnds()


    show: () =>
        @mainLayer.states.switchInstant("show")
        @mainLayer.center()

    hide: () =>
        @mainLayer.states.switchInstant("hidden")

    showWithTransition: () =>        
        @mainLayer.states.switch("show")

    hideWithTransition: () =>        
        @mainLayer.states.switch("hidden")

    play: () =>
        @isPlayCalled = true
        @mainLayer.states.switch("play")


module.exports = IntroLayerBase