ScreenMasterProjects = require "../screens/ScreenMasterProjects_1067x584"

ScreenDelegateBase = require "./ScreenDelegateBase_1067x584"

class ProjectsMenuDelegate_1067x584 extends ScreenDelegateBase
    afterButtonResidentialClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonResortsClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonOfficeBuildingClicked: () =>
        @afterButtonMasterPlanProjectsClicked()

    afterButtonMasterPlanProjectsClicked: () =>
        Utils.delay 0.5, =>
            @afterButtonMenuClicked =>            
                @mainMenuScreen.subMenuScreen = new ScreenMasterProjects
                    parent_screen: @mainMenuScreen

                @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                    @mainMenuScreen.delegate.afterProjectsButtonClicked()


module.exports = ProjectsMenuDelegate_1067x584