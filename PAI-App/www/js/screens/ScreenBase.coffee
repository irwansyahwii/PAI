class ScreenBase
    constructor: () ->
        @width = 1067
        @height = 584

        # @width = 1100
        # @height = 716

        @mainLayer = new Layer
            width: @width
            height: @height
            backgroundColor: 'black'

        @mainLayer.states.add
            hidden: 
                opacity: 0

            show:
                opacity: 1

    init: () =>
        @mainLayer.center()
                
    hideWithTransition: () =>
        @mainLayer.states.switch("hidden")

    hide: () =>
        @mainLayer.states.switchInstant("hidden")

    show: () =>
        @mainLayer.states.switchInstant("show")

    destroy: () =>
        @mainLayer.destroy()

    immersiveMode: () =>
        # if window.AndroidFullScreen
        #     AndroidFullScreen.immersiveMode()



module.exports =ScreenBase