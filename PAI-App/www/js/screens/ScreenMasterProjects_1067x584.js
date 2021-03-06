// Generated by CoffeeScript 1.9.2
(function() {
  var ClickEffect, ScreenBase, ScreenMasterProjects_1067x584, curvein, curvemove, curveout,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenBase = require("./ScreenBase_1067x584");

  ClickEffect = require("./ClickEffect");

  curvemove = 'cubic-bezier(0.2, 0, 0.8, 0.2)';

  curvein = 'cubic-bezier(0, 0, 0.2, 1)';

  curveout = 'cubic-bezier(0.4, 0, 1, 1)';

  ScreenMasterProjects_1067x584 = (function(superClass) {
    extend(ScreenMasterProjects_1067x584, superClass);

    function ScreenMasterProjects_1067x584(options) {
      this.play = bind(this.play, this);
      this.animateShowThumb = bind(this.animateShowThumb, this);
      this.animateHideThumb = bind(this.animateHideThumb, this);
      this.init = bind(this.init, this);
      this.hideAllLayers = bind(this.hideAllLayers, this);
      this.onThumbClicked = bind(this.onThumbClicked, this);
      var i, j, thumbLayer;
      ScreenMasterProjects_1067x584.__super__.constructor.apply(this, arguments);
      this.parent_screen = options.parent_screen || {};
      this.afterBackButtonClicked = null;
      if (this.parent_screen) {
        this.mainLayer.superLayer = this.parent_screen.mainLayer;
        this.mainLayer.placeBehind(this.parent_screen.topBarLayer);
      }
      this.mainLayer.backgroundColor = 'white';
      this.headerLayer = new Layer({
        image: 'images/MasterProjects-Header.png',
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
      this.thumbnails = [];
      for (i = j = 1; j <= 12; i = ++j) {
        thumbLayer = new Layer({
          image: "images/MasterProjects-Thumb" + i + ".png",
          width: 266,
          height: 154
        });
        thumbLayer.superLayer = this.mainLayer;
        thumbLayer.index = i - 1;
        ClickEffect.addTo(thumbLayer);
        thumbLayer.on(Events.Click, this.onThumbClicked);
        this.thumbnails.push(thumbLayer);
      }
      this.selectedThumb = null;
    }

    ScreenMasterProjects_1067x584.prototype.onThumbClicked = function(mouseEvent, thumbLayer) {
      this.selectedThumb = thumbLayer;
      this.hideAllLayers();
      if (this.delegate) {
        return this.delegate.afterThumbClicked(thumbLayer, thumbLayer.index);
      }
    };

    ScreenMasterProjects_1067x584.prototype.hideAllLayers = function() {
      var i, j, ref, results;
      this.headerLayer.states["switch"]("top_outside");
      results = [];
      for (i = j = 0, ref = this.thumbnails.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        results.push(this.animateHideThumb(this.thumbnails[i]));
      }
      return results;
    };

    ScreenMasterProjects_1067x584.prototype.init = function() {
      var i, j, ref, results, xIncrement, yIncrement;
      ScreenMasterProjects_1067x584.__super__.init.apply(this, arguments);
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
      xIncrement = 0;
      yIncrement = 0;
      results = [];
      for (i = j = 0, ref = this.thumbnails.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        if (i === 4 || i === 8) {
          xIncrement = 0;
        }
        if (i === 4) {
          yIncrement++;
        }
        if (i === 8) {
          yIncrement++;
        }
        this.thumbnails[i].states.add({
          hidden: {
            rotation: 0,
            x: 0 + 266 * xIncrement,
            y: this.mainLayer.height + 5
          },
          shown: {
            rotation: 360,
            x: 0 + 266 * xIncrement,
            y: (this.parent_screen.topBarLayer.height + this.headerLayer.height) + 154 * yIncrement
          },
          highlight: {
            rotation: 0,
            x: 0,
            y: this.parent_screen.topBarLayer.height + this.headerLayer.height,
            width: this.mainLayer.width,
            height: this.mainLayer.height - this.parent_screen.topBarLayer.height - this.headerLayer.height
          },
          fadeout: {
            opacity: 0
          }
        });
        this.thumbnails[i].states.switchInstant("hidden");
        results.push(xIncrement++);
      }
      return results;
    };

    ScreenMasterProjects_1067x584.prototype.animateHideThumb = function(thumb) {
      if ((this.selectedThumb === null) || thumb.index !== this.selectedThumb.index) {
        thumb.states.animationOptions = {
          time: 0.3,
          curve: curveout
        };
        return Utils.delay(_.random(0, 10) / 10, (function(_this) {
          return function() {
            return thumb.states["switch"]("hidden");
          };
        })(this));
      } else {
        thumb.states.animationOptions = {
          time: 0.8
        };
        return Utils.delay(_.random(0, 10) / 10, (function(_this) {
          return function() {
            thumb.states["switch"]("highlight");
            return Utils.delay(0.8, function() {
              return thumb.states["switch"]("fadeout");
            });
          };
        })(this));
      }
    };

    ScreenMasterProjects_1067x584.prototype.animateShowThumb = function(thumb, i) {
      thumb.states.animationOptions = {
        time: 0.3
      };
      return Utils.delay(_.random(0, 10) / 10, (function(_this) {
        return function() {
          return thumb.states["switch"]("shown");
        };
      })(this));
    };

    ScreenMasterProjects_1067x584.prototype.play = function() {
      var i, j, ref, results;
      this.show();
      this.headerLayer.states["switch"]("on_top");
      results = [];
      for (i = j = 0, ref = this.thumbnails.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        results.push(this.animateShowThumb(this.thumbnails[i]));
      }
      return results;
    };

    return ScreenMasterProjects_1067x584;

  })(ScreenBase);

  module.exports = ScreenMasterProjects_1067x584;

}).call(this);
