// Generated by CoffeeScript 1.9.2
(function() {
  var ClickEffect, ScreenBase, ScreenContact_1067x584,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenBase = require("./ScreenBase_1067x584");

  ClickEffect = require("./ClickEffect");

  ScreenContact_1067x584 = (function(superClass) {
    extend(ScreenContact_1067x584, superClass);

    function ScreenContact_1067x584(options) {
      this.play = bind(this.play, this);
      this.hideAllLayers = bind(this.hideAllLayers, this);
      this.backgroundImageLayerStateDidSwitch = bind(this.backgroundImageLayerStateDidSwitch, this);
      this.init = bind(this.init, this);
      ScreenContact_1067x584.__super__.constructor.apply(this, arguments);
      this.parent_screen = options.parent_screen || {};
      this.afterBackButtonClicked = null;
      if (this.parent_screen) {
        this.mainLayer.superLayer = this.parent_screen.mainLayer;
        this.mainLayer.placeBehind(this.parent_screen.topBarLayer);
      }
      this.mainLayer.backgroundColor = 'white';
      this.headerLayer = new Layer({
        image: 'images/Contact-Header.png',
        x: 0,
        y: this.parent_screen.topBarLayer.height - 1,
        width: this.width + 1,
        height: 40
      });
      this.headerLayer.superLayer = this.mainLayer;
      this.headerLayer.centerX();
      this.backButtonLayer = new Layer({
        image: 'images/ProfileMenu-Back.png',
        x: 19,
        y: 7,
        width: 45,
        height: 20
      });
      this.backButtonLayer.superLayer = this.headerLayer;
      this.backgroundImageLayer = new Layer({
        image: "images/Contact-Background.png",
        width: 1141,
        height: 591,
        scale: 1,
        x: -4,
        y: 50
      });
      this.backgroundImageLayer.superLayer = this.mainLayer;
      this.backgroundImageLayer.placeBehind(this.headerLayer);
      this.contactDescriptionLayer = new Layer({
        image: "images/Contact-Description.png",
        width: 308,
        height: 259,
        x: 0,
        y: 0
      });
      this.contactDescriptionLayer.superLayer = this.mainLayer;
      this.contactDescriptionLayer.states.animationOptions = {
        time: 0.3
      };
    }

    ScreenContact_1067x584.prototype.init = function() {
      ScreenContact_1067x584.__super__.init.apply(this, arguments);
      this.headerLayer.states.add({
        top_outside: {
          y: -this.headerLayer.height * -1 - 5
        },
        on_top: {
          y: this.parent_screen.topBarLayer.height - 1
        }
      });
      this.headerLayer.states.switchInstant("top_outside");
      ClickEffect.addTo(this.backButtonLayer);
      this.backButtonLayer.on(Events.Click, this.onBackButtonClicked);
      this.headerLayer.states.animationOptions = {
        time: 0.5
      };
      this.backgroundImageLayer.states.add({
        hidden: {
          y: -this.backgroundImageLayer.height - 5
        },
        shown: {
          y: 0
        },
        center_hidden: {
          scale: 0
        },
        center_shown: {
          scale: 1
        },
        scroll_topleft: {
          x: -70,
          y: 10
        },
        scroll_bottomright: {
          x: -4,
          y: 50
        },
        scroll_left: {
          x: -70
        },
        scroll_right: {
          x: -4
        }
      });
      this.backgroundImageLayer.states.switchInstant("hidden");
      this.backgroundImageLayer.on(Events.StateDidSwitch, this.backgroundImageLayerStateDidSwitch);
      this.contactDescriptionLayer.states.add({
        hidden_right: {
          x: this.mainLayer.width + 2,
          y: 140
        },
        shown_right: {
          x: this.mainLayer.width - this.contactDescriptionLayer.width
        }
      });
      return this.contactDescriptionLayer.states.switchInstant("hidden_right");
    };

    ScreenContact_1067x584.prototype.backgroundImageLayerStateDidSwitch = function(e, stateName) {
      if (stateName === "shown") {
        return this.contactDescriptionLayer.states["switch"]("shown_right");
      }
    };

    ScreenContact_1067x584.prototype.hideAllLayers = function() {
      this.headerLayer.states["switch"]("top_outside");
      this.backgroundImageLayer.states.animationOptions = {
        time: 0.3
      };
      this.backgroundImageLayer.states["switch"]("center_hidden");
      return this.contactDescriptionLayer.states["switch"]("hidden_right");
    };

    ScreenContact_1067x584.prototype.play = function() {
      this.show();
      this.headerLayer.states["switch"]("on_top");
      return this.backgroundImageLayer.states["switch"]("shown");
    };

    return ScreenContact_1067x584;

  })(ScreenBase);

  module.exports = ScreenContact_1067x584;

}).call(this);
