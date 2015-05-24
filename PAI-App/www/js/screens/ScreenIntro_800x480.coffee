ScreenBase = require("./ScreenBase")
ScreenIntro_1024_614 = require("./ScreenIntro_1024_614")
Intro1Layer = require("./Intro1Layer_800x480")

class ScreenIntro_800x480 extends ScreenIntro_1024_614

    createIntroLayers: () =>
        @intro1_layer = new Intro1Layer
            superLayer: @mainLayer
            width: @width
            height: @height    

        @intro_layers.add @intro1_layer

        # @subscribeLayerEvents()

module.exports =  ScreenIntro_800x480
