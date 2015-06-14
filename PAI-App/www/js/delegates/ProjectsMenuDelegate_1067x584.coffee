ScreenMasterProjects = require("../screens/ScreenMasterProjects_1067x584")

ScreenDelegateBase = require("./ScreenDelegateBase_1067x584")

MasterProjectsDelegate = require("./MasterProjectsDelegate_1067x584")

class ProjectsMenuDelegate_1067x584 extends ScreenDelegateBase    
    constructor:(options) ->
        super(options)
        @delay = 0.5
    afterButtonResidentialClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonResortsClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonOfficeBuildingClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonMasterPlanProjectsClicked: () =>
        Utils.delay @delay, =>
            @afterButtonMenuClicked =>            
                @mainMenuScreen.subMenuScreen = new ScreenMasterProjects
                    parent_screen: @mainMenuScreen

                @mainMenuScreen.subMenuScreen.delegate = new MasterProjectsDelegate(@mainMenuScreen, @)

                @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                    @mainMenuScreen.delegate.afterProjectsButtonClicked()


                
module.exports = ProjectsMenuDelegate_1067x584
