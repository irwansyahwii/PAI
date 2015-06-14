ScreenDelegateBase = require("./ScreenDelegateBase_1067x584")
ScreenThomas = require("../screens/ScreenThomas_1067x584")

class PersonnelDelegate_1067x584 extends ScreenDelegateBase

    afterThomasLayerClicked: () =>
        Utils.delay 0.5, =>
            @afterButtonMenuClicked =>
                @mainMenuScreen.subMenuScreen = new ScreenThomas
                    parent_screen: @mainMenuScreen

                @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>
                    @mainMenuScreen.delegate.afterPersonnelButtonClicked()

    afterLannyLayerClicked: () =>

module.exports = PersonnelDelegate_1067x584