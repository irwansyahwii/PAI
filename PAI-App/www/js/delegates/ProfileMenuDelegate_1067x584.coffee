ScreenFirmDescription = require "../screens/ScreenFirmDescription_1067x584"
ScreenPhilosophy = require "../screens/ScreenPhilosophy_1067x584"

ScreenDelegateBase = require "./ScreenDelegateBase_1067x584"

class ProfileMenuDelegate_1067x584 extends ScreenDelegateBase
    afterFirmDescriptionButtonClicked: () =>
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenFirmDescription
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.delegate.afterProfileButtonClicked()


    afterPhilosophyButtonClicked: () =>
        @afterButtonMenuClicked =>
            @mainMenuScreen.subMenuScreen = new ScreenPhilosophy
                parent_screen: @mainMenuScreen

            @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                @mainMenuScreen.delegate.afterProfileButtonClicked()


module.exports = ProfileMenuDelegate_1067x584