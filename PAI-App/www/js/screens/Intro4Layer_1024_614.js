// Generated by CoffeeScript 1.9.2
(function() {
  var Intro4Layer_1024_614, IntroLayerBase,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = require("./IntroLayerBase");

  Intro4Layer_1024_614 = (function(superClass) {
    extend(Intro4Layer_1024_614, superClass);

    function Intro4Layer_1024_614(options) {
      options = options || {};
      options.BGImage = "images/Intro-4-BG.png";
      Intro4Layer_1024_614.__super__.constructor.call(this, options);
    }

    return Intro4Layer_1024_614;

  })(IntroLayerBase);

  module.exports = Intro4Layer_1024_614;

}).call(this);
