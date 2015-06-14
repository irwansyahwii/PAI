ScreenProfileMenu = require "../screens/ScreenProfileMenu_1067x584"
ScreenProjectsMenu = require "../screens/ScreenProjectsMenu_1067x584"

ProfileMenuDelegate = require "./ProfileMenuDelegate_1067x584"
ProjectsMenuDelegate = require "./ProjectsMenuDelegate_1067x584"

ScreenDelegateBase = require "./ScreenDelegateBase_1067x584"

ScreenPersonnel = require "../screens/ScreenPersonnel_1067x584"
PersonnelDelegate = require "./PersonnelDelegate_1067x584"
ScreenContact = require "../screens/ScreenContact_1067x584"

class MainMenuDelegate_1067x584 extends ScreenDelegateBase
    afterButtonPAILayerClicked: () =>
        if @mainMenuScreen.subMenuScreen
            @mainMenuScreen.subMenuScreen.hideAllLayers()
            Utils.delay 0.5, =>
                @mainMenuScreen.destroyCurrentSubMenuScreen()
                @mainMenuScreen.play()

    afterProjectsButtonClicked: () =>            
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenProjectsMenu
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.play()


            @mainMenuScreen.subMenuScreen.delegate = new ProjectsMenuDelegate(@mainMenuScreen)

    afterPersonnelButtonClicked: () =>
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenPersonnel
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.play()


            @mainMenuScreen.subMenuScreen.delegate = new PersonnelDelegate(@mainMenuScreen)

    afterContactButtonClicked: () =>
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenContact
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.play()


            # @mainMenuScreen.subMenuScreen.delegate = new PersonnelDelegate(@mainMenuScreen)

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
