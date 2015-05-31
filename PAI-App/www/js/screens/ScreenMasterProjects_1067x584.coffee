ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

class ScreenMasterProjects_1067x584 extends ScreenBase
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
            image: 'images/MasterProjects-Header.png'
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

        @thumbnails = []

        for i in [1..12]
            thumbLayer = new Layer
                image: "images/MasterProjects-Thumb#{i}.png"
                width: 266
                height: 154
            thumbLayer.superLayer = @mainLayer
            ClickEffect.addTo thumbLayer
            @thumbnails.push thumbLayer


    hideAllLayers: () =>
        @headerLayer.states.switch("top_outside")

        for i in [0..@thumbnails.length - 1]
            @animateHideThumb @thumbnails[i]

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

        xIncrement = 0
        yIncrement = 0
        for i in [0..@thumbnails.length - 1]
            
            if i is 4 or i is 8
                xIncrement = 0
            if i is 4
                yIncrement++
            if i is 8
                yIncrement++


            @thumbnails[i].states.add
                hidden:
                    x: 0 + 266 * xIncrement
                    y: @mainLayer.height + 5
                shown:
                    x: 0 + 266 * xIncrement
                    y: (@parent_screen.topBarLayer.height + @headerLayer.height )+ 154 * yIncrement

            @thumbnails[i].states.switchInstant("hidden")

            xIncrement++

    animateHideThumb: (thumb, i) =>
        thumb.states.animationOptions = 
            time: 0.3
        Utils.delay (_.random(0, 10) / 10), =>
            thumb.states.switch("hidden")

    animateShowThumb: (thumb, i) =>
        thumb.states.animationOptions = 
            time: 0.3
        Utils.delay (_.random(0, 10) / 10), =>
            thumb.states.switch("shown")

    play: () =>
        @show() 
        @headerLayer.states.switch("on_top")

        for i in [0..@thumbnails.length - 1]
            @animateShowThumb @thumbnails[i]

module.exports = ScreenMasterProjects_1067x584