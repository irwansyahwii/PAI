

# ScreenIntro = require "./screens/ScreenIntro_800x480"
ScreenIntro = require "./screens/ScreenIntro_1067x584"
ScreenMainMenu = require "./screens/ScreenMainMenu_1067x584"
ScreenProfileMenu = require "./screens/ScreenProfileMenu_1067x584"

# alert(Screen.width) 1067
# alert(Screen.height) 584


# alert("#{Screen.width}x#{Screen.height}") 
# alert("#{Canvas.width}x#{Canvas.height}") 

class App
    constructor: () ->
        @subMenuScreen = null
        @mainMenu = null

    play: () =>
        # Framer.Device.deviceType = "fullscreen"
        # Framer.Device.fullScreen = true
        # Framer.Device.orientation = 90

        
        intro = new ScreenIntro()
        

        intro.onExit = () =>
            intro.destroy()
            intro = null
            @mainMenu = new ScreenMainMenu() 
            @mainMenu.afterProfileButtonClicked = @afterMainMenuProfileButtonClicked           
            @mainMenu.init()
            @mainMenu.play()

        intro.init()
        intro.play()


    destroyCurrentSubMenuScreen: () =>
        if @subMenuScreen isnt null
            @subMenuScreen.destroy()
            @subMenuScreen = null
    afterMainMenuProfileButtonClicked: () =>
        Utils.delay 0.3, =>
            @destroyCurrentSubMenuScreen()

            @subMenuScreen = new ScreenProfileMenu
                parent_screen: @mainMenu
            @subMenuScreen.init()
            @subMenuScreen.play()


module.exports = App