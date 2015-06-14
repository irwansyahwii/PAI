ScreenDelegateBase = require("./ScreenDelegateBase_1067x584")
ScreenGenericProjectDetail = require("../screens/ScreenGenericProjectDetail_1067x584")


class MasterProjectsDelegate_1067x584 extends ScreenDelegateBase
    constructor:(mainMenuScreen, previousScreenDelegate)->
        super(mainMenuScreen)
        @previousScreenDelegate = previousScreenDelegate


    afterThumbClicked: (thumb, thumbIndex) =>
        Utils.delay 1, =>
            @afterButtonMenuClicked =>            
                
                @mainMenuScreen.subMenuScreen = new ScreenGenericProjectDetail
                    parent_screen: @mainMenuScreen

                @mainMenuScreen.subMenuScreen.afterBackButtonClicked = =>    
                    @previousScreenDelegate.delay = 0                      
                    @previousScreenDelegate.afterButtonMasterPlanProjectsClicked()




module.exports = MasterProjectsDelegate_1067x584