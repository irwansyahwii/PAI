ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

class ScreenThomas_1067x584 extends ScreenBase
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
            image: 'images/Thomas-Header.png'
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
            image: "images/Thomas-Background.png"
            width: 1141
            height: 591
            scale: 1
            x: -4
            y: 50
            # y: @parent_screen.topBarLayer.height + @headerLayer.height

        @backgroundImageLayer.superLayer = @mainLayer
        @backgroundImageLayer.placeBehind @headerLayer

    init: () =>
        super
        @headerLayer.states.add
            top_outside: 
                y: - @headerLayer.height * -1 - 5
            on_top:
                y: @parent_screen.topBarLayer.height - 1

        @headerLayer.states.switchInstant("top_outside")
        

        ClickEffect.addTo @backButtonLayer

        @backButtonLayer.on Events.Click, @onBackButtonClicked

        
        @backgroundImageLayer.states.add
            hidden: 
                x: -@backgroundImageLayer.width
            shown:
                x: 0
            right:
                x: @mainLayer.width + 5


        @backgroundImageLayer.states.switchInstant("hidden")


    play: () =>
        @show()
        @headerLayer.states.switch("on_top")
        @backgroundImageLayer.states.switch("shown")

    hideAllLayers: () =>
        @headerLayer.states.switch("top_outside")
        @backgroundImageLayer.states.switch("right")


module.exports = ScreenThomas_1067x584