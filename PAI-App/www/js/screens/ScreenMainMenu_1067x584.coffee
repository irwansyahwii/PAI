ScreenBase = require("./ScreenBase_1067x584")

ClickEffect = require("./ClickEffect")

class ScreenMainMenu_1067x584 extends ScreenBase
    constructor: () ->

        super




        # @tempLayer = new Layer
        #     backgroundColor: 'white'
        #     width: @width
        #     height: @height

        # @tempLayer.superLayer = @mainLayer


        @topBarLayer = new Layer
            image: 'images/TopBarWithLogo.png'
            width: @width
            height: 76

        @topBarLayer.superLayer = @mainLayer
        @topBarLayer.centerX()

        @profileLayer = new Layer
            image: 'images/MainMenu-Profile.png'
            width: 532
            height: 250

        @profileLayer.superLayer = @mainLayer        

        @personnelLayer = new Layer
            image: 'images/MainMenu-Personnel.png'
            width: 533
            height: 255

        @personnelLayer.superLayer = @mainLayer

        @projectsLayer = new Layer
            image: 'images/MainMenu-Projects.png'
            width: 531
            height: 250

        @projectsLayer.superLayer = @mainLayer

        @contactLayer = new Layer
            image: 'images/MainMenu-Contact.png'
            width: 532
            height: 255

        @contactLayer.superLayer = @mainLayer

    initContactLayer: () =>
        @contactLayer.states.add
            left_outside:
                x: @mainLayer.width + @contactLayer.width 
                y: @projectsLayer.height + @projectsLayer.y

            on_left: 
                x: @profileLayer.width + 3
                y: @projectsLayer.height + @projectsLayer.y + 2

        @contactLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @contactLayer.states.switchInstant("left_outside")

        @contactLayer.on Events.Click, @onContactLayerClicked

        ClickEffect.addTo @contactLayer

    initProjectsLayer: () =>
        @projectsLayer.states.add
            left_outside:
                x: @mainLayer.width + @projectsLayer.width 
                y: @topBarLayer.height

            on_left: 
                x: @profileLayer.width + 3
                y: @topBarLayer.height

        @projectsLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @projectsLayer.states.switchInstant("left_outside")

        @projectsLayer.on Events.Click, @onProjectsLayerClicked

        ClickEffect.addTo @projectsLayer

    initPersonnelLayer: () =>
        @personnelLayer.states.add
            left_outside:
                x: @personnelLayer.width  * -1 - 10
                y: @profileLayer.y + @profileLayer.height

            on_left: 
                x: 0
                y: @profileLayer.y + @profileLayer.height + 2

        @personnelLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @personnelLayer.states.switchInstant("left_outside")

        @personnelLayer.on Events.Click, @onPersonnelLayerClicked

        ClickEffect.addTo @personnelLayer

    initProfileLayer: () =>
        @profileLayer.states.add
            left_outside:
                x: @profileLayer.width * -1 - 10
                y: @topBarLayer.height

            on_left: 
                x: 0
                y: @topBarLayer.height

        @profileLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @profileLayer.states.switchInstant("left_outside")

        @profileLayer.on Events.Click, @onProfileLayerClicked

        ClickEffect.addTo @profileLayer

    initTopBarLayer: () =>
        @topBarLayer.states.add
            top_outside: 
                x: 0
                y: (@topBarLayer.height) * -1
            on_top: 
                x: 0
                y: 0

        @topBarLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @topBarLayer.states.switchInstant("top_outside")

    hideAllMenuLayers: () =>
        @profileLayer.states.switch("left_outside")
        @personnelLayer.states.switch("left_outside")
        @projectsLayer.states.switch("left_outside")
        @contactLayer.states.switch("left_outside")      
        @mainLayer.backgroundColor = "black"  



    onProfileLayerClicked: (event, layer) =>
        @hideAllMenuLayers()

    onPersonnelLayerClicked: (event, layer) =>
        @hideAllMenuLayers()

    onProjectsLayerClicked: (event, layer) =>
        @hideAllMenuLayers()

    onContactLayerClicked: (event, layer) =>
        @hideAllMenuLayers()

    init: () =>
        super



        @initTopBarLayer()
        @initProfileLayer()
        @initPersonnelLayer()
        @initProjectsLayer()
        @initContactLayer()


        # @hideAllMenuLayers()

        # @topBarLayer.states.switch("on_top")
        # @profileLayer.states.switch("on_left")
        # @projectsLayer.states.switch("on_left")

        # @tempLayer.destroy()

    play: () =>
        @topBarLayer.states.switch("on_top")
        @profileLayer.states.switch("on_left")
        @personnelLayer.states.switch("on_left")
        @projectsLayer.states.switch("on_left")
        @contactLayer.states.switch("on_left")

        @mainLayer.backgroundColor = "white"


module.exports = ScreenMainMenu_1067x584