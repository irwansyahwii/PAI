// Generated by CoffeeScript 1.9.2
(function() {
  var MasterProjectsDelegate_1067x584, ScreenDelegateBase, ScreenGenericProjectDetail,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenDelegateBase = require("./ScreenDelegateBase_1067x584");

  ScreenGenericProjectDetail = require("../screens/ScreenGenericProjectDetail_1067x584");

  MasterProjectsDelegate_1067x584 = (function(superClass) {
    extend(MasterProjectsDelegate_1067x584, superClass);

    function MasterProjectsDelegate_1067x584(mainMenuScreen, previousScreenDelegate) {
      this.afterThumbClicked = bind(this.afterThumbClicked, this);
      MasterProjectsDelegate_1067x584.__super__.constructor.call(this, mainMenuScreen);
      this.previousScreenDelegate = previousScreenDelegate;
    }

    MasterProjectsDelegate_1067x584.prototype.afterThumbClicked = function(thumb, thumbIndex) {
      return Utils.delay(1, (function(_this) {
        return function() {
          return _this.afterButtonMenuClicked(function() {
            _this.mainMenuScreen.subMenuScreen = new ScreenGenericProjectDetail({
              parent_screen: _this.mainMenuScreen
            });
            return _this.mainMenuScreen.subMenuScreen.afterBackButtonClicked = function() {
              _this.previousScreenDelegate.delay = 0;
              return _this.previousScreenDelegate.afterButtonMasterPlanProjectsClicked();
            };
          });
        };
      })(this));
    };

    return MasterProjectsDelegate_1067x584;

  })(ScreenDelegateBase);

  module.exports = MasterProjectsDelegate_1067x584;

}).call(this);