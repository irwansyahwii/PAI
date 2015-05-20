// Generated by CoffeeScript 1.9.2
(function() {
  var FramerApp, main_module;

  require("ngCordova");

  FramerApp = require("./framerApp");

  main_module = angular.module('starter', ['ionic', "ngCordova"]);

  main_module.run((function(_this) {
    return function($ionicPlatform, $cordovaStatusbar, $cordovaSplashscreen) {
      return $ionicPlatform.ready(function() {
        var app;
        if (window.cordova) {
          if (window.cordova && window.cordova.plugins.Keyboard) {
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
          }
        }
        app = new FramerApp();
        return app.play();
      });
    };
  })(this));

}).call(this);
