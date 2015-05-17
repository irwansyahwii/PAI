ScreenBase = require("./ScreenBase")
RoundCollection = require("./RoundCollection")
Intro1Layer = require("./Intro1Layer_1024_614")
Intro2Layer = require("./Intro2Layer_1024_614")
Intro3Layer = require("./Intro3Layer_1024_614")
Intro4Layer = require("./Intro4Layer_1024_614")

class ScreenIntro_1024_614 extends ScreenBase

    constructor: () ->
        super
        @mainLayer = new Layer
            width: @width
            height: @height
            backgroundColor: 'white'

        @mainLayer.states.add
            hidden: 
                opacity: 0

            show:
                opacity: 1

        @intro_layers = new RoundCollection()

        @is_stop_all_animations = false

        @onExit = null

    createIntroLayers: () =>

        @intro1_layer = new Intro1Layer
            superLayer: @mainLayer
            width: @width
            height: @height    

        @intro_layers.add @intro1_layer

        @intro2_layer = new Intro2Layer
            superLayer: @mainLayer
            width: @width
            height: @height    

        @intro_layers.add @intro2_layer

        @intro3_layer = new Intro3Layer
            superLayer: @mainLayer
            width: @width
            height: @height    

        @intro_layers.add @intro3_layer


        @intro4_layer = new Intro4Layer
            superLayer: @mainLayer
            width: @width
            height: @height    

        @intro_layers.add @intro4_layer

        for layer in @intro_layers.list
            layer.init()
            console.log(layer.BGLayer.image)
            layer.onPlayEnds = () =>
                if not @is_stop_all_animations
                    setTimeout(() => 
                            @intro_layers.current().hideWithTransition()
                        , 2000)

                    setTimeout(() =>
                            @intro_layers.next().play()
                        , 2000)
                


    init: () =>
        @createIntroLayers()
        @mainLayer.center()
        @hide()

        @mainLayer.on Events.Click, @onMainLayerClicked

    onMainLayerClicked: (event, layer) =>
        @is_stop_all_animations = true
        @hideWithTransition()
        if @onExit
            @onExit()

    play: () =>
        @show()
        @intro_layers.current().play()

    hideWithTransition: () =>
        @mainLayer.states.switch("hidden")

    hide: () =>
        @mainLayer.states.switchInstant("hidden")

    show: () =>
        @mainLayer.states.switchInstant("show")
        

module.exports =  ScreenIntro_1024_614