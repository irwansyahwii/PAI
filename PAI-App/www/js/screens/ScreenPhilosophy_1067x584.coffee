ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

class ScreenPhilosophy_1067x584 extends ScreenBase
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
            image: 'images/Philosophy-Header.png'
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
            image: "images/Philosophy-Background.png"
            width: 1141
            height: 591
            scale: 1
            x: -4
            y: 50
            # y: @parent_screen.topBarLayer.height + @headerLayer.height

        @backgroundImageLayer.superLayer = @mainLayer
        @backgroundImageLayer.placeBehind @headerLayer


        @philosophyDescriptionLayer = new Layer
            image: "images/Philosophy-Philosophy.png"
            width: 308
            height: 299
            x: 0
            y: 0

        @philosophyDescriptionLayer.superLayer = @mainLayer

        @philosophyDescriptionLayer.states.animationOptions =
            time: 0.3
        

        @afterBackButtonClicked = null

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

        @headerLayer.states.animationOptions = 
            time: 0.5

        @backgroundImageLayer.states.add
            center_hidden:
                scale: 0
            center_shown:
                scale: 1
            scroll_topleft:
                x: -70
                y: 10
            scroll_bottomright:
                x: -4
                y: 50
            scroll_left:
                x: -70
            scroll_right: 
                x: -4

        @backgroundImageLayer.states.switchInstant("center_shown")

        @backgroundImageLayer.on Events.StateDidSwitch, @backgroundImageLayerStateDidSwitch

        @philosophyDescriptionLayer.states.add
            hidden_right:
                x: @mainLayer.width + 2
                y: 140
            shown_right:
                x: @mainLayer.width - @philosophyDescriptionLayer.width


        @philosophyDescriptionLayer.states.switchInstant("hidden_right")

    backgroundImageLayerStateDidSwitch: (e, stateName) =>
        if stateName is "center_shown"
            @backgroundImageLayer.states.animationOptions =
                time: 8

            Utils.delay 1, =>
                @backgroundImageLayer.states.switch("scroll_topleft")

            @philosophyDescriptionLayer.states.switch("shown_right")

        if stateName is "scroll_topleft"
            Utils.delay 1, =>
                @backgroundImageLayer.states.switch("scroll_bottomright")

        if stateName is "scroll_bottomright"
            Utils.delay 1, =>
                @backgroundImageLayer.states.switch("scroll_left")

        if stateName is "scroll_left"
            Utils.delay 1, =>
                @backgroundImageLayer.states.switch("scroll_right")

        if stateName is "scroll_right"
            Utils.delay 1, =>
                @backgroundImageLayer.states.switch("scroll_topleft")        

    hideAllLayers: () =>
        @headerLayer.states.switch("top_outside")

        @backgroundImageLayer.states.animationOptions =
            time: 0.3
        @backgroundImageLayer.states.switch("center_hidden")
        @philosophyDescriptionLayer.states.switch("hidden_right")


    onBackButtonClicked: () =>
        @hideAllLayers()
        if @afterBackButtonClicked isnt null
            @afterBackButtonClicked(@)

    play: () =>
        @show()
        @headerLayer.states.switch("on_top")
        @backgroundImageLayer.states.switch("center_shown")


module.exports = ScreenPhilosophy_1067x584
