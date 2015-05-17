class IntroLayerBase extends Layer
    constructor: (options) ->
        super(options)

        superLayer = options.superLayer

        @mainLayer = @

        @mainLayer.width = options.width
        @mainLayer.height = options.height        

        @mainLayer.on Events.StateDidSwitch, @onMainLayerStateDidSwitch

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

    init: () =>
        @mainLayer.hide()

    onMainLayerStateDidSwitch: (e, stateName) =>
        if stateName is "play"            
            @onPlayEnds()

    show: () =>
        @mainLayer.states.switchInstant("show")

    hide: () =>
        @mainLayer.states.switchInstant("hidden")

    showWithTransition: () =>        
        @mainLayer.states.switch("show")

    hideWithTransition: () =>        
        @mainLayer.states.switch("hidden")

    play: () =>
        @mainLayer.states.switch("play")


module.exports = IntroLayerBase