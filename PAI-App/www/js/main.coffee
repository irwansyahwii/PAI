FramerApp = require("./framerApp")

main_module =  angular.module('starter', ['ionic'])

main_module.run(($ionicPlatform) => 
        # alert('angular run');
        $ionicPlatform.ready(() =>            
                # alert('$ionicPlatform.ready')
                if window.plugins and window.plugins.orientationLock
                    window.plugins.orientationLock.lock("landscape")    
                if window.cordova and window.cordova.plugins.Keyboard
                    cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
                
                if window.StatusBar
                  # org.apache.cordova.statusbar required
                  StatusBar.styleDefault();

                app = new FramerApp()
                app.play()
            )
    )