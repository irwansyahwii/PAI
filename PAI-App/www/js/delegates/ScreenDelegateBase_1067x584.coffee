class ScreenDelegateBase_1067x584

    constructor:(mainMenuScreen) ->
        @mainMenuScreen = mainMenuScreen      
        

    afterButtonMenuClicked: (setupFn) =>              
        Utils.delay 0.3, =>
            @mainMenuScreen.destroyCurrentSubMenuScreen()

            setupFn()

            @mainMenuScreen.subMenuScreen.init()
            @mainMenuScreen.subMenuScreen.play()


module.exports = ScreenDelegateBase_1067x584