ScreenBase = require("./ScreenBase_1067x584")
ClickEffect = require("./ClickEffect")


class ScreenProjectsMenu_1067x584 extends ScreenBase
    constructor: (options) ->
        super

        @parent_screen = options.parent_screen || {}

        @afterBackButtonClicked = null

        if @parent_screen
            @mainLayer.superLayer = @parent_screen.mainLayer
            @mainLayer.placeBehind @parent_screen.topBarLayer

        @mainLayer.backgroundColor = 'white'

        @buttonMasterplanProjects = new Layer
            image:'images/ProjectsMenu-Masterplan.png'
            width:1070
            height:129
            x: 0
            y: @parent_screen.topBarLayer.height 

        @buttonMasterplanProjects.superLayer = @mainLayer

        @buttonOfficeBuilding = new Layer
            image:'images/ProjectsMenu-Office.png'
            width:1070
            height:129
            x: 0
            y: @parent_screen.topBarLayer.height + 129

        @buttonOfficeBuilding.superLayer = @mainLayer

        @buttonResorts = new Layer
            image:'images/ProjectsMenu-Resort.png'
            width:1070
            height:129
            x: 0
            y: @parent_screen.topBarLayer.height + 129*2

        @buttonResorts.superLayer = @mainLayer

        @buttonResidential = new Layer
            image:'images/ProjectsMenu-Residential.png'
            width:1070
            height:129
            x: 0
            y: @parent_screen.topBarLayer.height + 129*3

        @buttonResidential.superLayer = @mainLayer

    init: () =>
        super

        @buttonMasterplanProjects.states.add 
            bottom_hidden: 
                y: @mainLayer.height + @buttonMasterplanProjects.height + 5
            on_screen:
                y:@parent_screen.topBarLayer.height - 2

        @buttonOfficeBuilding.states.add 
            bottom_hidden: 
                y: @mainLayer.height + @buttonOfficeBuilding.height + 5
            on_screen:
                y:@parent_screen.topBarLayer.height + @buttonOfficeBuilding.height - 2

        @buttonResorts.states.add 
            bottom_hidden: 
                y: @mainLayer.height + @buttonResorts.height + 5
            on_screen:
                y:@parent_screen.topBarLayer.height + @buttonOfficeBuilding.height * 2 - 2

        @buttonResidential.states.add 
            bottom_hidden: 
                y: @mainLayer.height + @buttonResidential.height + 5
            on_screen:
                y:@parent_screen.topBarLayer.height + @buttonOfficeBuilding.height * 3 - 2

        @buttonMasterplanProjects.states.switchInstant("bottom_hidden")
        @buttonOfficeBuilding.states.switchInstant("bottom_hidden")
        @buttonResorts.states.switchInstant("bottom_hidden")
        @buttonResidential.states.switchInstant("bottom_hidden")

        @buttonOfficeBuilding.states.animationOptions =
            time: 0.5
        @buttonMasterplanProjects.states.animationOptions =
            time: 0.5
        @buttonResorts.states.animationOptions =
            time: 0.5
        @buttonResidential.states.animationOptions =
            time: 0.5

        ClickEffect.addTo @buttonMasterplanProjects
        ClickEffect.addTo @buttonOfficeBuilding
        ClickEffect.addTo @buttonResorts
        ClickEffect.addTo @buttonResidential


        @buttonMasterplanProjects.on Events.Click, @onButtonMasterplanProjectsClick
        @buttonOfficeBuilding.on Events.Click, @onButtonOfficeBuildingClick
        @buttonResorts.on Events.Click, @onButtonResortsClick
        @buttonResidential.on Events.Click, @onButtonResidentialClick

    onButtonResidentialClick: () =>
        @hideAllLayers()
        if @delegate
            @delegate.afterButtonResidentialClicked()

    onButtonResortsClick: () =>
        @hideAllLayers()
        if @delegate
            @delegate.afterButtonResortsClicked()

    onButtonOfficeBuildingClick: () =>
        @hideAllLayers()
        if @delegate
            @delegate.afterButtonOfficeBuildingClicked()

    onButtonMasterplanProjectsClick: () =>
        @hideAllLayers()
        if @delegate
            @delegate.afterButtonMasterPlanProjectsClicked()

    hideAllLayers: =>
        Utils.delay 0.3, =>
            @buttonMasterplanProjects.states.switch("bottom_hidden")
        Utils.delay 0.2, =>
            @buttonOfficeBuilding.states.switch("bottom_hidden")
        Utils.delay 0.1, =>
            @buttonResorts.states.switch("bottom_hidden")
        @buttonResidential.states.switch("bottom_hidden")

    play: () =>
        @show()

        @buttonMasterplanProjects.states.switch("on_screen")
        Utils.delay 0.1, =>
            @buttonOfficeBuilding.states.switch("on_screen")
        Utils.delay 0.2, =>
            @buttonResorts.states.switch("on_screen")
        Utils.delay 0.3, =>
            @buttonResidential.states.switch("on_screen")

module.exports = ScreenProjectsMenu_1067x584