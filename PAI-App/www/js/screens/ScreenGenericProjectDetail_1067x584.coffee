ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")
# ScrollComponent = require("./ScrollComponent")

thumbScale = 0.4

class ScreenGenericProjectDetail_1067x584 extends ScreenBase
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
            image: 'images/ProjectDetail-Header.png'
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

        @backgroundLayer = new Layer
            image: 'images/ProjectDetail-Full1.png'
            width: 1072
            height: 710
            y: -10

        @backgroundLayer.superLayer = @mainLayer
        @backgroundLayer.placeBehind @headerLayer

        @backgroundLayer.on Events.Click, @onBackgroundLayerClicked

        @detailDescriptionLayer = new Layer
            image: 'images/ProjectDetail-Detail1.png'
            width: 308
            height: 359

        @detailDescriptionLayer.superLayer = @mainLayer


        
        @thumbScroll = new ScrollComponent
            backgroundColor: 'transparent'
            width: @mainLayer.width
            height: 154 * thumbScale
            x: 0
            y: @mainLayer.height - (154 * thumbScale)
            scrollHorizontal: true

        @thumbScroll.superLayer = @mainLayer

        for i in [1..12]
            thumbLayer = new Layer
                image: "images/MasterProjects-Thumb#{i}.png"
                width: 266 * thumbScale
                height: 154 * thumbScale
                x: (i-1) * (266*thumbScale) + 2

            thumbLayer.superLayer = @thumbScroll

        # @thumbScroll.contentInset =
        #     top: 20
        #     right: 0
        #     bottom: 20
        #     left: 0

        @isThumbScrollShown = true

    hideAllLayers: () =>
        @backgroundLayer.states.switch("fadeout")
        @headerLayer.states.switch("top_outside")
        @detailDescriptionLayer.states.switch("hidden")
        @thumbScroll.states.switch("hidden")

        @parent_screen.disableStateSwitching = false

    init: () =>
        super

        @headerLayer.states.add
            top_outside: 
                y: - @headerLayer.height 
            on_top:
                y: @parent_screen.topBarLayer.height - 1

        @headerLayer.states.switchInstant("top_outside")


        ClickEffect.addTo @backButtonLayer
        @backButtonLayer.on Events.Click, @onBackButtonClicked

        @thumbScroll.states.add
            hidden:
                y: @mainLayer.height + 2
            shown: 
                y: @mainLayer.height - (154 * thumbScale)

        @backgroundLayer.states.add
            fadein:
                opacity: 1
            fadeout: 
                opacity: 0

        @backgroundLayer.states.switchInstant("fadeout")

        @detailDescriptionLayer.states.add
            hidden:
                x: (@mainLayer.width + @detailDescriptionLayer.width)  + 5
                y: 130
            shown:
                x: (@mainLayer.width - @detailDescriptionLayer.width)
                y: 130

        @detailDescriptionLayer.states.switchInstant("hidden")

        @parent_screen.disableStateSwitching = true

    onBackgroundLayerClicked: () =>
        if @isThumbScrollShown
            @isThumbScrollShown = false
            @thumbScroll.states.switch("hidden")
            @headerLayer.states.switch("top_outside")
            @parent_screen.topBarLayer.states.switch("hidden")
            @detailDescriptionLayer.states.switch("hidden")
        else
            @isThumbScrollShown = true
            @thumbScroll.states.switch("shown")
            @headerLayer.states.switch("on_top")
            @parent_screen.topBarLayer.states.switch("shown")
            @detailDescriptionLayer.states.switch("shown")


    play: () =>
        @show()
        @headerLayer.states.switch("on_top")
        @backgroundLayer.states.switch("fadein")
        @detailDescriptionLayer.states.switch("shown")
            

module.exports = ScreenGenericProjectDetail_1067x584