// Generated by CoffeeScript 1.9.2
(function() {
  var GenericIntroLayerWithAnim_1067x584, IntroLayerBase,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = require("./IntroLayerBase");

  GenericIntroLayerWithAnim_1067x584 = (function(superClass) {
    extend(GenericIntroLayerWithAnim_1067x584, superClass);

    function GenericIntroLayerWithAnim_1067x584(options) {
      this.play = bind(this.play, this);
      this.hideAllInstantly = bind(this.hideAllInstantly, this);
      this.playTextAnimation = bind(this.playTextAnimation, this);
      this.onBackgroundLayerStateDidSwitch = bind(this.onBackgroundLayerStateDidSwitch, this);
      this.init = bind(this.init, this);
      this.options = options || {};
      this.options.BGImage = this.options.imageInfo.background.image_name;
      GenericIntroLayerWithAnim_1067x584.__super__.constructor.call(this, this.options);
      this.is_start = true;
      this.backgroundLayer = this.BGLayer;
      this.backgroundLayer.width = this.options.imageInfo.background.width;
      this.backgroundLayer.height = this.options.imageInfo.background.height;
      this.captionLayer = new Layer({
        image: this.options.imageInfo.caption.image_name,
        width: this.options.imageInfo.caption.width,
        height: this.options.imageInfo.caption.height,
        x: this.options.imageInfo.caption.x,
        y: this.options.imageInfo.caption.y
      });
      this.captionLayer.superLayer = this.mainLayer;
      this.text1Layer = new Layer({
        image: this.options.imageInfo.text1.image_name,
        width: this.options.imageInfo.text1.width,
        height: this.options.imageInfo.text1.height,
        x: this.options.imageInfo.text1.x,
        y: this.options.imageInfo.text1.y
      });
      this.text1Layer.superLayer = this.mainLayer;
    }

    GenericIntroLayerWithAnim_1067x584.prototype.init = function() {
      GenericIntroLayerWithAnim_1067x584.__super__.init.apply(this, arguments);
      this.text1Layer.states.add({
        hidden: {
          opacity: 0
        },
        shown: {
          opacity: 1
        }
      });
      this.backgroundLayer.states.add({
        first: {
          x: this.options.imageInfo.background.first.x,
          y: this.options.imageInfo.background.first.y
        },
        bottom: {
          x: this.options.imageInfo.background.bottom.x,
          y: this.options.imageInfo.background.bottom.y
        },
        center: {
          x: this.options.imageInfo.background.center.x,
          y: this.options.imageInfo.background.center.y
        }
      });
      this.backgroundLayer.on(Events.StateDidSwitch, this.onBackgroundLayerStateDidSwitch);
      this.captionLayer.states.add({
        hidden: {
          opacity: 0
        },
        shown: {
          opacity: 1
        }
      });
      return this.hideAllInstantly();
    };

    GenericIntroLayerWithAnim_1067x584.prototype.onBackgroundLayerStateDidSwitch = function(prevState, stateName) {
      if (prevState === "first" && stateName === "bottom") {
        this.backgroundLayer.states["switch"]("center");
      }
      if (prevState === "bottom" && stateName === "center") {
        return this.playTextAnimation();
      }
    };

    GenericIntroLayerWithAnim_1067x584.prototype.playTextAnimation = function() {
      var captionAnim;
      captionAnim = this.captionLayer.animate({
        properties: {
          opacity: 1
        },
        time: 2
      });
      return captionAnim.on("end", (function(_this) {
        return function() {
          var text1anim;
          text1anim = _this.text1Layer.animate({
            properties: {
              opacity: 1
            },
            time: 2
          });
          return text1anim.on("end", function() {
            return Utils.delay(2, function() {
              _this.hideWithTransition();
              return Utils.delay(2.5, function() {
                return _this.onPlayEnds();
              });
            });
          });
        };
      })(this));
    };

    GenericIntroLayerWithAnim_1067x584.prototype.hideAllInstantly = function() {
      this.captionLayer.states.switchInstant("hidden");
      this.backgroundLayer.states.switchInstant('first');
      return this.text1Layer.states.switchInstant("hidden");
    };

    GenericIntroLayerWithAnim_1067x584.prototype.play = function() {
      var delayValue;
      delayValue = 3;
      if (this.is_start) {
        delayValue = 0;
      }
      return Utils.delay(delayValue, (function(_this) {
        return function() {
          _this.hideAllInstantly();
          _this.show();
          return _this.backgroundLayer.states["switch"]("bottom");
        };
      })(this));
    };

    return GenericIntroLayerWithAnim_1067x584;

  })(IntroLayerBase);

  module.exports = GenericIntroLayerWithAnim_1067x584;

}).call(this);
