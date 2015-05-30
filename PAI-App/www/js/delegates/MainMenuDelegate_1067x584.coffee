ScreenProfileMenu = require "../screens/ScreenProfileMenu_1067x584"
ScreenProjectsMenu = require "../screens/ScreenProjectsMenu_1067x584"

ProfileMenuDelegate = require "./ProfileMenuDelegate_1067x584"
ProjectsMenuDelegate = require "./ProjectsMenuDelegate_1067x584"

ScreenDelegateBase = require "./ScreenDelegateBase_1067x584"

class MainMenuDelegate_1067x584 extends ScreenDelegateBase
    afterProjectsButtonClicked: () =>            
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenProjectsMenu
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.play()

            @mainMenuScreen.subMenuScreen.delegate = new ProjectsMenuDelegate(@mainMenuScreen)


    afterProfileButtonClicked: () =>
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenProfileMenu
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.play()
                
            @mainMenuScreen.subMenuScreen.delegate = new ProfileMenuDelegate(@mainMenuScreen)

            @mainMenuScreen.subMenuScreen.afterFirmDescriptionButtonClicked = @afterFirmDescriptionButtonClicked
            @mainMenuScreen.subMenuScreen.afterPhilosophyButtonClicked = @afterPhilosophyButtonClicked

module.exports = MainMenuDelegate_1067x584
