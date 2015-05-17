// Generated by CoffeeScript 1.9.2
(function() {
  var IntroLayerBase,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = (function(superClass) {
    extend(IntroLayerBase, superClass);

    function IntroLayerBase(options) {
      this.play = bind(this.play, this);
      this.hideWithTransition = bind(this.hideWithTransition, this);
      this.showWithTransition = bind(this.showWithTransition, this);
      this.hide = bind(this.hide, this);
      this.show = bind(this.show, this);
      this.onMainLayerStateDidSwitch = bind(this.onMainLayerStateDidSwitch, this);
      this.init = bind(this.init, this);
      var superLayer;
      IntroLayerBase.__super__.constructor.call(this, options);
      superLayer = options.superLayer;
      this.mainLayer = this;
      this.mainLayer.width = options.width;
      this.mainLayer.height = options.height;
      this.mainLayer.on(Events.StateDidSwitch, this.onMainLayerStateDidSwitch);
      if (superLayer) {
        this.mainLayer.superLayer = superLayer;
      }
      this.mainLayer.states.add({
        hidden: {
          opacity: 0
        },
        show: {
          opacity: 1
        },
        play: {
          opacity: 1
        }
      });
      this.mainLayer.states.animationOptions = {
        time: 3
      };
      this.BGLayer = new Layer({
        image: options.BGImage,
        width: this.width,
        height: this.height
      });
      this.BGLayer.superLayer = this.mainLayer;
      this.BGLayer.center();
      this.onPlayEnds = null;
    }

    IntroLayerBase.prototype.init = function() {
      return this.mainLayer.hide();
    };

    IntroLayerBase.prototype.onMainLayerStateDidSwitch = function(e, stateName) {
      if (stateName === "play") {
        return this.onPlayEnds();
      }
    };

    IntroLayerBase.prototype.show = function() {
      return this.mainLayer.states.switchInstant("show");
    };

    IntroLayerBase.prototype.hide = function() {
      return this.mainLayer.states.switchInstant("hidden");
    };

    IntroLayerBase.prototype.showWithTransition = function() {
      return this.mainLayer.states["switch"]("show");
    };

    IntroLayerBase.prototype.hideWithTransition = function() {
      return this.mainLayer.states["switch"]("hidden");
    };

    IntroLayerBase.prototype.play = function() {
      return this.mainLayer.states["switch"]("play");
    };

    return IntroLayerBase;

  })(Layer);

  module.exports = IntroLayerBase;

}).call(this);
