// Generated by CoffeeScript 1.9.2
(function() {
  var ScreenDelegateBase_1067x584,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ScreenDelegateBase_1067x584 = (function() {
    function ScreenDelegateBase_1067x584(mainMenuScreen) {
      this.afterButtonMenuClicked = bind(this.afterButtonMenuClicked, this);
      this.mainMenuScreen = mainMenuScreen;
    }

    ScreenDelegateBase_1067x584.prototype.afterButtonMenuClicked = function(setupFn) {
      return Utils.delay(0.3, (function(_this) {
        return function() {
          _this.mainMenuScreen.destroyCurrentSubMenuScreen();
          setupFn();
          _this.mainMenuScreen.subMenuScreen.init();
          return _this.mainMenuScreen.subMenuScreen.play();
        };
      })(this));
    };

    return ScreenDelegateBase_1067x584;

  })();

  module.exports = ScreenDelegateBase_1067x584;

}).call(this);