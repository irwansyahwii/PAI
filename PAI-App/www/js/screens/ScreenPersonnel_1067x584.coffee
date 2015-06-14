ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

class ScreenPersonnel_1067x584 extends ScreenBase
    constructor: (options) ->
        super

        @parent_screen = options.parent_screen || {}

        @afterBackButtonClicked = null

        if @parent_screen
            @mainLayer.superLayer = @parent_screen.mainLayer
            @mainLayer.placeBehind @parent_screen.topBarLayer

        @mainLayer.backgroundColor = 'white'

        @headerLayer = new Layer
            # backgroundColor: '#2c2b27'
            image: 'images/PersonnelMenu-Header.png'
            x: 0
            y: @parent_screen.topBarLayer.height - 1
            width: @width + 1
            height: 40

        @headerLayer.superLayer = @mainLayer
        @headerLayer.centerX()

        @backButtonLayer = new Layer
            image: 'images/ProfileMenu-Back.png'
            x: 19
            y: 7
            width:45
            height: 20

        @backButtonLayer.superLayer = @headerLayer

        @backgroundImageLayer = new Layer
            image: "images/PersonnelMenu-Background.png"
            width: 1141
            height: 591
            scale: 1
            x: -4
            y: 50
            # y: @parent_screen.topBarLayer.height + @headerLayer.height

        @backgroundImageLayer.superLayer = @mainLayer
        @backgroundImageLayer.placeBehind @headerLayer

        @thomasLayer = new Layer
            image: 'images/PersonnelMenu-Thomas.png'
            width: 317
            height: 315
            x: 136
            y: 190
        @thomasLayer.superLayer = @mainLayer

        @lannylayer = new Layer
            image: 'images/PersonnelMenu-Lanny.png'
            width: 317
            height: 315
            x: 612
            y: 190
        @lannylayer.superLayer = @mainLayer

    init: () =>
        super

        @backgroundImageLayer.states.add
            hidden:
                y: @mainLayer.height + 5
            shown:
                y: 50

        ClickEffect.addTo @backButtonLayer
        @backButtonLayer.on Events.Click, @onBackButtonClicked

        ClickEffect.addTo @thomasLayer
        ClickEffect.addTo @lannylayer

        @headerLayer.states.add
            top_outside: 
                y: - @headerLayer.height * -1 - 5
            on_top:
                y: @parent_screen.topBarLayer.height - 1

        @headerLayer.states.switchInstant("top_outside")

        @thomasLayer.states.add
            hidden:
                x: -@thomasLayer.width
            shown:
                x: 136

        @lannylayer.states.add
            hidden:
                x: @mainLayer.width + 5
            shown:
                x: 612

        @thomasLayer.states.switchInstant("hidden")
        @lannylayer.states.switchInstant("hidden")
        @backgroundImageLayer.states.switchInstant("hidden")

        @thomasLayer.on Events.Click, @onThomasLayerClicked
        @lannylayer.on Events.Click, @onLannyLayerClicked

    onThomasLayerClicked: () =>
        @hideAllLayers()
        if @delegate
            @delegate.afterThomasLayerClicked()

    onLannyLayerClicked: () =>
        # @hideAllLayers()
        # if @delegate
        #     @delegate.afterLannyLayerClicked()


    play: () =>
        @show()
        @backgroundImageLayer.states.switch("shown")
        @headerLayer.states.switch("on_top")
        @thomasLayer.states.switch("shown")
        @lannylayer.states.switch("shown")

    hideAllLayers: () =>
        @backgroundImageLayer.states.switch("hidden")
        @headerLayer.states.switch("top_outside")
        @thomasLayer.states.switch("hidden")
        @lannylayer.states.switch("hidden")


module.exports = ScreenPersonnel_1067x584