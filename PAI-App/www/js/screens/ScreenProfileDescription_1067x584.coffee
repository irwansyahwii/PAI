ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

class ScreenProfileDescription_1067x584 extends ScreenBase
    constructor: (options) ->
        super

        @parent_screen = options.parent_screen || {}

        if @parent_screen
            @mainLayer.superLayer = @parent_screen.mainLayer
            @mainLayer.placeBehind @parent_screen.topBarLayer


        @mainLayer.backgroundColor = 'white'

        @headerLayer = new Layer
            # backgroundColor: '#2c2b27'
            image: 'images/ProfileMenu-Header-Template.png'
            x: 0
            y: @parent_screen.topBarLayer.height - 1
            width: @width + 1
            height: 37

        @headerLayer.superLayer = @mainLayer
        @headerLayer.centerX()

        @backButtonLayer = new Layer
            image: 'images/ProfileMenu-Back.png'
            x: 19
            y: 7
            width:45
            height: 20

        @backButtonLayer.superLayer = @headerLayer


        @profileTitleLayer = new Layer
            image: 'images/ProfileMenu-Profile.png'
            x: 500
            y: 7
            width: 69
            height: 27

        @profileTitleLayer.superLayer = @headerLayer

        @firmDescriptionButton = new Layer
            image: 'images/ProfileMenu-FirmDescription.png'
            width: @width
            height: 233


        @firmDescriptionButton.superLayer = @mainLayer


        @philosophyButton = new Layer
            image: 'images/ProfileMenu-Philosophy.png'
            width: @width
            height: 236


        @philosophyButton.superLayer = @mainLayer


    init: () =>
        super

        @headerLayer.states.add
            top_outside: 
                y: - @headerLayer.height * -1 - 5
            on_top:
                y: @parent_screen.topBarLayer.height - 1

        @headerLayer.states.switchInstant("top_outside")


        @firmDescriptionButton.states.add
            left_outside:
                x:@firmDescriptionButton.width * - 1 - 5
                y: 114

            on_top:
                x: 0
        @firmDescriptionButton.states.switchInstant("left_outside")


        @philosophyButton.states.add
            right_outside:
                x: @philosophyButton.width + 5
                y: 348

            on_bottom:
                x: 0

        @philosophyButton.states.switchInstant("right_outside")

        ClickEffect.addTo @backButtonLayer
        ClickEffect.addTo @firmDescriptionButton
        ClickEffect.addTo @philosophyButton

        @backButtonLayer.on Events.Click, @onBackButtonClicked
        @firmDescriptionButton.on Events.Click, @onFirmDescriptionButtonClicked
        @philosophyButton.on Events.Click, @onPhilosophyButtonClicked

        @headerLayer.states.animationOptions = 
            time: 0.5

        @firmDescriptionButton.states.animationOptions = 
            time: 0.5

        @philosophyButton.states.animationOptions = 
            time: 0.5


        @firmDescriptionButton.on Events.StateDidSwitch, @onFirmDescriptionStateDidSwitch

    onFirmDescriptionStateDidSwitch: (e, stateName) =>
        if stateName is "on_top"
            @headerLayer.states.switch("on_top")

    hideAllLayers: () =>
        @headerLayer.states.switch("top_outside")
        @firmDescriptionButton.states.switch("left_outside")
        @philosophyButton.states.switch("right_outside")


    onBackButtonClicked: () =>

    onFirmDescriptionButtonClicked: () =>
        @hideAllLayers()

    onPhilosophyButtonClicked: () =>
        @hideAllLayers()


    play: () =>
        @show()
        # @headerLayer.states.switch("on_top")
        @firmDescriptionButton.states.switch("on_top")
        @philosophyButton.states.switch("on_bottom")

module.exports = ScreenProfileDescription_1067x584

