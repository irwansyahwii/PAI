require("ngCordova")

FramerApp = require("./framerApp")



main_module =  angular.module('starter', ['ionic', "ngCordova"])

main_module.run(($ionicPlatform, $cordovaStatusbar, $cordovaSplashscreen) => 


        # alert('angular run');
        $ionicPlatform.ready(() =>            
                # alert('$ionicPlatform.ready')

                if window.cordova
                    # $cordovaStatusbar.hide()

                    # $cordovaSplashscreen.hide()

                    # if window.plugins and window.plugins.orientationLock
                        # window.plugins.orientationLock.lock("landscape")    
                    if window.cordova and window.cordova.plugins.Keyboard
                        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
                    

                    


                # if window.StatusBar
                #   # org.apache.cordova.statusbar required
                #   StatusBar.styleDefault();

                # ionic.Platform.fullScreen()

                # if window.AndroidFullScreen
                #     AndroidFullScreen.immersiveMode()

                # if window.AndroidFullScreen

                #     AndroidFullScreen.immersiveMode(=>
                #             app = new FramerApp()
                #             app.play()
                        
                #         , =>
                #             )
                # else
                app = new FramerApp()
                app.play()


            )
    )