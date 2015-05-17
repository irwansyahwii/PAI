class ScreenBase
    constructor: () ->
        @width = 1024
        @height = 600

        @mainLayer = new Layer
            width: @width
            height: @height
            backgroundColor: 'white'

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