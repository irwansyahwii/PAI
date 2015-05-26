ScreenBase = require("./ScreenBase")

ClickEffect = require("./ClickEffect")

curvemove = 'cubic-bezier(0.4, 0, 0.2, 1)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'


class ScreenMainMenu_1024_641 extends ScreenBase
    constructor: () ->

        super

        @topBarLayer = new Layer
            # image: 'images/TopBarWithLogo.png'
            backgroundColor: '#2c2b27'
            width: @width 
            height: 88

        @topBarLayer.superLayer = @mainLayer
        @topBarLayer.centerX()

        @profileLayer = new Layer
            image: 'images/MainMenu-Profile.png'
            width: 514
            height: 269

        @profileLayer.superLayer = @mainLayer        

        @personnelLayer = new Layer
            image: 'images/MainMenu-Personnel.png'
            width: 512
            height: 268

        @personnelLayer.superLayer = @mainLayer

        @projectsLayer = new Layer
            image: 'images/MainMenu-Projects.png'
            width: 514
            height: 268

        @projectsLayer.superLayer = @mainLayer

        @contactLayer = new Layer
            image: 'images/MainMenu-Contact.png'
            width: 514
            height: 268

        @contactLayer.superLayer = @mainLayer

    initContactLayer: () =>
        @contactLayer.states.add
            left_outside:
                x: @mainLayer.width + @contactLayer.width 
                y: @projectsLayer.height + @projectsLayer.y

            on_left: 
                x: @profileLayer.width
                y: @projectsLayer.height + @projectsLayer.y

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
                x: @profileLayer.width
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
                x: @personnelLayer.width * -1
                y: @profileLayer.y + @profileLayer.height

            on_left: 
                x: 0
                y: @profileLayer.y + @profileLayer.height

        @personnelLayer.states.animationOptions = 
            time: 0.2
            curve: "spring(40, 0, 0)" 

        @personnelLayer.states.switchInstant("left_outside")

        @personnelLayer.on Events.Click, @onPersonnelLayerClicked

        ClickEffect.addTo @personnelLayer

    initProfileLayer: () =>
        @profileLayer.states.add
            left_outside:
                x: @profileLayer.width * -1
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
            time: 0.3
            curve: curvein
            delay: 0
            

        @topBarLayer.states.switchInstant("top_outside")

    hideAllMenuLayers: () =>
        @profileLayer.states.switch("left_outside")
        @personnelLayer.states.switch("left_outside")
        @projectsLayer.states.switch("left_outside")
        @contactLayer.states.switch("left_outside")        



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

    play: () =>
        @topBarLayer.states.switch("on_top")
        @profileLayer.states.switch("on_left")
        @personnelLayer.states.switch("on_left")
        @projectsLayer.states.switch("on_left")
        @contactLayer.states.switch("on_left")


module.exports = ScreenMainMenu_1024_641