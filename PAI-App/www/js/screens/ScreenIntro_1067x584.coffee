ScreenBase = require("./ScreenBase_1067x584")

ScreenIntro_1024_614 = require("./ScreenIntro_1024_614")

Intro1Layer = require("./Intro1Layer_1067x584")
GenericIntroLayer = require("./GenericIntroLayerWithAnim_1067x584")

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
            {
                background: 
                    image_name: 'images/Intro2-Background.png'
                    width: 1093
                    height: 1085
                    first:
                        x: 0
                        y: 0
                    bottom:
                        x: 0
                        y: -420
                    center:
                        x:0
                        y: -381
                text1: 
                    image_name: 'images/Intro2-Text1.png'
                    width: 241
                    height: 167
                    x: 801
                    y: 321                    
                caption: 
                    image_name: 'images/Intro2-Caption.png'
                    width: 492
                    height: 46
                    x: 533
                    y: 530                    
            }
            {
                background: 
                    image_name: 'images/Intro3-Background.png'
                    width: 1073
                    height: 1067
                    first:
                        x: 0
                        y: 0
                    bottom:
                        x: 0
                        y: -409
                    center:
                        x:0
                        y: -323
                text1: 
                    image_name: 'images/Intro3-Text1.png'
                    width: 173
                    height: 263
                    x: 767
                    y: 252
                caption: 
                    image_name: 'images/Intro3-Caption.png'
                    width: 314
                    height: 46
                    x: 350
                    y: 500
            }
        ]

        for image in images
            intro_layer = new GenericIntroLayer
                imageInfo: image
                superLayer: @mainLayer
                width: @width
                height: @height
            @intro_layers.add intro_layer

        @subscribeLayerEvents()

module.exports = ScreenIntro_1067x584