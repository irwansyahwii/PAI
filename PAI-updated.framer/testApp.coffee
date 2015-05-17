ScreenIntro = require "./screens/ScreenIntro"
ScreenMainMenu = require "./screens/ScreenMainMenu"


mainMenu = null
intro = new ScreenIntro()
intro.init()

intro.onExit = () =>
    intro = null
    mainMenu = new ScreenMainMenu()
    mainMenu.init()
    mainMenu.play()
intro.play()

