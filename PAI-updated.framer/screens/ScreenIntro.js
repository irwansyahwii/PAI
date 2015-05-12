// Generated by CoffeeScript 1.9.2
(function() {
  var Screen, ScreenBase,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenBase = require("./ScreenBase");

  Screen = (function(superClass) {
    extend(Screen, superClass);

    function Screen() {
      this.center = bind(this.center, this);
      this.play = bind(this.play, this);
      this.getNextImageIndex = bind(this.getNextImageIndex, this);
      this.onMainLayerClicked = bind(this.onMainLayerClicked, this);
      this.init = bind(this.init, this);
      Screen.__super__.constructor.apply(this, arguments);
      this.onExit = null;
      this.layer = new Layer({
        width: this.width,
        height: this.height
      });
      this.fadeInAnimation = new Animation({
        time: 3,
        properties: {
          opacity: 1
        }
      });
      this.fadeOutAnimation = new Animation({
        time: 3,
        properties: {
          opacity: 0
        }
      });
      this.imageLayers = [];
      this.currentImageIndex = 0;
      this.isFirstTimePlayed = true;
      this.lastTimeoutId = -1;
    }

    Screen.prototype.init = function() {
      var i, image, images, len;
      images = ['/imported/PAI-updated/images/Intro 1.png', '/imported/PAI-updated/images/Intro 2.png', '/imported/PAI-updated/images/Intro 3.png', '/imported/PAI-updated/images/Intro 4.png'];
      for (i = 0, len = images.length; i < len; i++) {
        image = images[i];
        this.imageLayer = new Layer({
          image: image,
          width: this.width,
          height: this.height,
          opacity: 0
        });
        this.imageLayer.superLayer = this.layer;
        this.imageLayers.push(this.imageLayer);
      }
      this.imageLayers[0].opacity = 1;
      this.layer.states.add({
        hidden: {
          opacity: 0
        }
      });
      this.layer.states.add({
        visible: {
          opacity: 1
        }
      });
      this.layer.center();
      return this.layer.on(Events.Click, this.onMainLayerClicked);
    };

    Screen.prototype.onMainLayerClicked = function(event, layer) {
      if (this.lastTimeoutId > -1) {
        clearTimeout(this.lastTimeoutId);
      }
      this.layer.destroy();
      if (this.onExit) {
        return this.onExit();
      }
    };

    Screen.prototype.getNextImageIndex = function(currentImageIndex) {
      var nextImageIndex;
      nextImageIndex = currentImageIndex + 1;
      if (nextImageIndex >= this.imageLayers.length) {
        nextImageIndex = 0;
      }
      return nextImageIndex;
    };

    Screen.prototype.play = function() {
      var fadeInIndex;
      console.log("@play called");
      this.layer.states["switch"]("visible");
      if (!this.isFirstTimePlayed) {
        fadeInIndex = this.getNextImageIndex(this.currentImageIndex);
        this.fadeInAnimation.options.layer = this.imageLayers[fadeInIndex];
        this.fadeOutAnimation.options.layer = this.imageLayers[this.currentImageIndex];
        this.fadeOutAnimation.start();
        this.fadeInAnimation.start();
        return this.lastTimeoutId = setTimeout((function(_this) {
          return function() {
            _this.currentImageIndex += 1;
            if (_this.currentImageIndex >= _this.imageLayers.length) {
              _this.currentImageIndex = 0;
            }
            return _this.play();
          };
        })(this), 5000);
      } else {
        this.isFirstTimePlayed = false;
        return setTimeout((function(_this) {
          return function() {
            return _this.play();
          };
        })(this), 3000);
      }
    };

    Screen.prototype.center = function() {
      return this.layer.center();
    };

    return Screen;

  })(ScreenBase);

  module.exports = Screen;

}).call(this);