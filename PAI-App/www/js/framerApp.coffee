

# ScreenIntro = require "./screens/ScreenIntro_800x480"
ScreenIntro = require "./screens/ScreenIntro_1067x584"
ScreenMainMenu = require "./screens/ScreenMainMenu_1067x584"

# alert(Screen.width) 1067
# alert(Screen.height) 584


# alert("#{Screen.width}x#{Screen.height}") 
# alert("#{Canvas.width}x#{Canvas.height}") 

class App
    play: () =>
        # Framer.Device.deviceType = "fullscreen"
        # Framer.Device.fullScreen = true
        # Framer.Device.orientation = 90

        mainMenu = null
        intro = new ScreenIntro()
        

        intro.onExit = () =>
            intro.destroy()
            intro = null
            mainMenu = new ScreenMainMenu()
            mainMenu.init()
            mainMenu.play()

        intro.init()
        intro.play()

module.exports = App