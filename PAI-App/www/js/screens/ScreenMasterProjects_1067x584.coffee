ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")

curvemove = 'cubic-bezier(0.2, 0, 0.8, 0.2)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'


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
            thumbLayer.index = i - 1
            ClickEffect.addTo thumbLayer
            thumbLayer.on Events.Click, @onThumbClicked
            @thumbnails.push thumbLayer

        @selectedThumb = null

    onThumbClicked: (mouseEvent, thumbLayer) =>
        @selectedThumb = thumbLayer
        @hideAllLayers()
        if @delegate
            @delegate.afterThumbClicked(thumbLayer, thumbLayer.index)


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
                    rotation: 0
                    x: 0 + 266 * xIncrement
                    y: @mainLayer.height + 5
                shown:
                    rotation: 360
                    x: 0 + 266 * xIncrement
                    y: (@parent_screen.topBarLayer.height + @headerLayer.height )+ 154 * yIncrement

                highlight:                    
                    rotation: 0                    
                    x: 0
                    y: (@parent_screen.topBarLayer.height + @headerLayer.height )
                    width: @mainLayer.width
                    height: @mainLayer.height - @parent_screen.topBarLayer.height - @headerLayer.height
                fadeout:
                    opacity: 0



            @thumbnails[i].states.switchInstant("hidden")

            xIncrement++    

    animateHideThumb: (thumb) =>
        if (@selectedThumb is null) or  thumb.index isnt @selectedThumb.index
            thumb.states.animationOptions =             
                time: 0.3
                curve: curveout
            Utils.delay (_.random(0, 10) / 10), =>
                thumb.states.switch("hidden")
        else
            thumb.states.animationOptions =             
                time: 0.8
                
            Utils.delay (_.random(0, 10) / 10), =>
                thumb.states.switch("highlight")     
                Utils.delay 0.8, =>
                    thumb.states.switch("fadeout")

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