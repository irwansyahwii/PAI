

ScreenIntro = require "./screens/ScreenIntro_1024_614"
ScreenMainMenu = require "./screens/ScreenMainMenu"

class App
    play: () =>

        mainMenu = null
        intro = new ScreenIntro()
        

        intro.onExit = () =>
            intro = null
            mainMenu = new ScreenMainMenu()
            mainMenu.init()
            mainMenu.play()

        intro.init()
        intro.play()

module.exports = App