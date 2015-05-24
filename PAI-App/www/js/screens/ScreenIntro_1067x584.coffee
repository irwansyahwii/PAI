ScreenBase = require("./ScreenBase_1067x584")

ScreenIntro_1024_614 = require("./ScreenIntro_1024_614")

Intro1Layer = require("./Intro1Layer_1067x584")
GenericIntroLayer = require("./GenericIntroLayer_1067x584")

class ScreenIntro_1067x584 extends ScreenIntro_1024_614
    constructor: () ->
        super

        @mainLayer.width = ScreenBase.WIDTH
        @mainLayer.height = ScreenBase.HEIGHT

    createIntroLayers: () =>
        console.log "createIntroLayers called"

        intro_layer = new Intro1Layer
            superLayer: @mainLayer
            width: @width
            height: @height
        @intro_layers.add intro_layer

        images = [
            "images/Intro-2-Template.png"
            "images/Intro-3-Template.png"
        ]

        for image in images
            intro_layer = new GenericIntroLayer
                BGImage: image
                superLayer: @mainLayer
                width: @width
                height: @height
            @intro_layers.add intro_layer

        console.log "@intro_layers.count : #{@intro_layers.list.length}"

        @subscribeLayerEvents()

module.exports = ScreenIntro_1067x584