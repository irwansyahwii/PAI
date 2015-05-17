(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var App, ScreenIntro, ScreenMainMenu,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ScreenIntro = require("./screens/ScreenIntro_1024_614");

  ScreenMainMenu = require("./screens/ScreenMainMenu");

  App = (function() {
    function App() {
      this.play = bind(this.play, this);
    }

    App.prototype.play = function() {
      var intro, mainMenu;
      mainMenu = null;
      intro = new ScreenIntro();
      intro.onExit = (function(_this) {
        return function() {
          intro = null;
          mainMenu = new ScreenMainMenu();
          mainMenu.init();
          return mainMenu.play();
        };
      })(this);
      intro.init();
      return intro.play();
    };

    return App;

  })();

  module.exports = App;

}).call(this);

},{"./screens/ScreenIntro_1024_614":10,"./screens/ScreenMainMenu":11}],2:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var FramerApp, main_module;

  FramerApp = require("./framerApp");

  main_module = angular.module('starter', ['ionic']);

  main_module.run((function(_this) {
    return function($ionicPlatform) {
      return $ionicPlatform.ready(function() {
        var app;
        if (window.plugins && window.plugins.orientationLock) {
          window.plugins.orientationLock.lock("landscape");
        }
        if (window.cordova && window.cordova.plugins.Keyboard) {
          cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        }
        if (window.StatusBar) {
          StatusBar.styleDefault();
        }
        app = new FramerApp();
        return app.play();
      });
    };
  })(this));

}).call(this);

},{"./framerApp":1}],3:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var Intro1Layer_1024_614, IntroLayerBase,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = require("./IntroLayerBase");

  Intro1Layer_1024_614 = (function(superClass) {
    extend(Intro1Layer_1024_614, superClass);

    function Intro1Layer_1024_614(options) {
      this.hideWithTransition = bind(this.hideWithTransition, this);
      this.showWithTransition = bind(this.showWithTransition, this);
      this.show = bind(this.show, this);
      options = options || {};
      options.BGImage = "img/Intro-1-BG.png";
      Intro1Layer_1024_614.__super__.constructor.call(this, options);
    }

    Intro1Layer_1024_614.prototype.show = function() {
      return this.mainLayer.states.switchInstant("show");
    };

    Intro1Layer_1024_614.prototype.showWithTransition = function() {
      return this.mainLayer.states["switch"]("show");
    };

    Intro1Layer_1024_614.prototype.hideWithTransition = function() {
      return this.mainLayer.states["switch"]("hidden");
    };

    return Intro1Layer_1024_614;

  })(IntroLayerBase);

  module.exports = Intro1Layer_1024_614;

}).call(this);

},{"./IntroLayerBase":7}],4:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var Intro2Layer_1024_614, IntroLayerBase,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = require("./IntroLayerBase");

  Intro2Layer_1024_614 = (function(superClass) {
    extend(Intro2Layer_1024_614, superClass);

    function Intro2Layer_1024_614(options) {
      options = options || {};
      options.BGImage = "img/Intro-2-BG.png";
      Intro2Layer_1024_614.__super__.constructor.call(this, options);
    }

    return Intro2Layer_1024_614;

  })(IntroLayerBase);

  module.exports = Intro2Layer_1024_614;

}).call(this);

},{"./IntroLayerBase":7}],5:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var Intro3Layer_1024_614, IntroLayerBase,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  IntroLayerBase = require("./IntroLayerBase");

  Intro3Layer_1024_614 = (function(superClass) {
    extend(Intro3Layer_1024_614, superClass);

    function Intro3Layer_1024_614(options) {
      options = options || {};
      options.BGImage = "img/Intro-3-BG.png";
      Intro3Layer_1024_614.__super__.constructor.call(this, options);
    }

    return Intro3Layer_1024_614;

  })(IntroLayerBase);

  module.exports = Intro3Layer_1024_614;

}).call(this);

},{"./IntroLayerBase":7}],6:[function(require,module,exports){
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
      options.BGImage = "img/Intro-4-BG.png";
      Intro4Layer_1024_614.__super__.constructor.call(this, options);
    }

    return Intro4Layer_1024_614;

  })(IntroLayerBase);

  module.exports = Intro4Layer_1024_614;

}).call(this);

},{"./IntroLayerBase":7}],7:[function(require,module,exports){
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

},{}],8:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var RoundCollection,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  RoundCollection = (function() {
    function RoundCollection() {
      this.current = bind(this.current, this);
      this.prev = bind(this.prev, this);
      this.next = bind(this.next, this);
      this.add = bind(this.add, this);
      this.list = [];
      this.current_index = 0;
      console.log("constructor : @current_index: " + this.current_index);
    }

    RoundCollection.prototype.add = function(item) {
      return this.list.push(item);
    };

    RoundCollection.prototype.next = function() {
      this.current_index += 1;
      if (this.current_index >= this.list.length) {
        this.current_index = 0;
      }
      console.log("next() : @current_index: " + this.current_index);
      return this.list[this.current_index];
    };

    RoundCollection.prototype.prev = function() {
      this.current_index -= this.current_index < 0 ? this.current_index = this.list.length - 1 : void 0;
      console.log("prev() : @current_index: " + this.current_index);
      return this.list[this.current_index];
    };

    RoundCollection.prototype.current = function() {
      return this.list[this.current_index];
    };

    return RoundCollection;

  })();

  module.exports = RoundCollection;

}).call(this);

},{}],9:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var ScreenBase;

  ScreenBase = (function() {
    function ScreenBase() {
      this.width = 1024;
      this.height = 600;
    }

    return ScreenBase;

  })();

  module.exports = ScreenBase;

}).call(this);

},{}],10:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var Intro1Layer, Intro2Layer, Intro3Layer, Intro4Layer, RoundCollection, ScreenBase, ScreenIntro_1024_614,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenBase = require("./ScreenBase");

  RoundCollection = require("./RoundCollection");

  Intro1Layer = require("./Intro1Layer_1024_614");

  Intro2Layer = require("./Intro2Layer_1024_614");

  Intro3Layer = require("./Intro3Layer_1024_614");

  Intro4Layer = require("./Intro4Layer_1024_614");

  ScreenIntro_1024_614 = (function(superClass) {
    extend(ScreenIntro_1024_614, superClass);

    function ScreenIntro_1024_614() {
      this.show = bind(this.show, this);
      this.hide = bind(this.hide, this);
      this.hideWithTransition = bind(this.hideWithTransition, this);
      this.play = bind(this.play, this);
      this.onMainLayerClicked = bind(this.onMainLayerClicked, this);
      this.init = bind(this.init, this);
      this.createIntroLayers = bind(this.createIntroLayers, this);
      ScreenIntro_1024_614.__super__.constructor.apply(this, arguments);
      this.mainLayer = new Layer({
        width: this.width,
        height: this.height,
        backgroundColor: 'white'
      });
      this.mainLayer.states.add({
        hidden: {
          opacity: 0
        },
        show: {
          opacity: 1
        }
      });
      this.intro_layers = new RoundCollection();
      this.is_stop_all_animations = false;
      this.onExit = null;
    }

    ScreenIntro_1024_614.prototype.createIntroLayers = function() {
      var i, layer, len, ref, results;
      this.intro1_layer = new Intro1Layer({
        superLayer: this.mainLayer,
        width: this.width,
        height: this.height
      });
      this.intro_layers.add(this.intro1_layer);
      this.intro2_layer = new Intro2Layer({
        superLayer: this.mainLayer,
        width: this.width,
        height: this.height
      });
      this.intro_layers.add(this.intro2_layer);
      this.intro3_layer = new Intro3Layer({
        superLayer: this.mainLayer,
        width: this.width,
        height: this.height
      });
      this.intro_layers.add(this.intro3_layer);
      this.intro4_layer = new Intro4Layer({
        superLayer: this.mainLayer,
        width: this.width,
        height: this.height
      });
      this.intro_layers.add(this.intro4_layer);
      ref = this.intro_layers.list;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        layer = ref[i];
        layer.init();
        console.log(layer.BGLayer.image);
        results.push(layer.onPlayEnds = (function(_this) {
          return function() {
            if (!_this.is_stop_all_animations) {
              setTimeout(function() {
                return _this.intro_layers.current().hideWithTransition();
              }, 2000);
              return setTimeout(function() {
                return _this.intro_layers.next().play();
              }, 2000);
            }
          };
        })(this));
      }
      return results;
    };

    ScreenIntro_1024_614.prototype.init = function() {
      this.createIntroLayers();
      this.mainLayer.center();
      this.hide();
      return this.mainLayer.on(Events.Click, this.onMainLayerClicked);
    };

    ScreenIntro_1024_614.prototype.onMainLayerClicked = function(event, layer) {
      this.is_stop_all_animations = true;
      this.hideWithTransition();
      if (this.onExit) {
        return this.onExit();
      }
    };

    ScreenIntro_1024_614.prototype.play = function() {
      this.show();
      return this.intro_layers.current().play();
    };

    ScreenIntro_1024_614.prototype.hideWithTransition = function() {
      return this.mainLayer.states["switch"]("hidden");
    };

    ScreenIntro_1024_614.prototype.hide = function() {
      return this.mainLayer.states.switchInstant("hidden");
    };

    ScreenIntro_1024_614.prototype.show = function() {
      return this.mainLayer.states.switchInstant("show");
    };

    return ScreenIntro_1024_614;

  })(ScreenBase);

  module.exports = ScreenIntro_1024_614;

}).call(this);

},{"./Intro1Layer_1024_614":3,"./Intro2Layer_1024_614":4,"./Intro3Layer_1024_614":5,"./Intro4Layer_1024_614":6,"./RoundCollection":8,"./ScreenBase":9}],11:[function(require,module,exports){
// Generated by CoffeeScript 1.9.2
(function() {
  var ScreenBase, ScreenMainMenu,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenBase = require("./ScreenBase");

  ScreenMainMenu = (function(superClass) {
    extend(ScreenMainMenu, superClass);

    function ScreenMainMenu() {
      this.play = bind(this.play, this);
      this.init = bind(this.init, this);
      ScreenMainMenu.__super__.constructor.apply(this, arguments);
      this.layer = new Layer({
        backgroundColor: 'black',
        width: this.width,
        height: this.height
      });
      this.layerProfile = new Layer({
        backgroundColor: 'red',
        x: 0,
        y: 0,
        width: this.width / 2,
        height: this.height / 2
      });
      this.layerProfile.superLayer = this.layer;
      this.layerProjects = new Layer({
        backgroundColor: 'green',
        x: this.layerProfile.width,
        y: 0,
        width: this.width - this.layerProfile.width,
        height: this.height - this.layerProfile.height
      });
      this.layerProjects.superLayer = this.layer;
      this.layerPersonnel = new Layer({
        backgroundColor: 'blue',
        x: 0,
        y: this.layerProfile.height,
        width: this.layerProfile.width,
        height: this.layerProfile.height
      });
      this.layerPersonnel.superLayer = this.layer;
      this.layerContact = new Layer({
        backgroundColor: 'yellow',
        x: this.layerProjects.width,
        y: this.layerProjects.height,
        width: this.layerProjects.width,
        height: this.layerProjects.height
      });
      this.layerContact.superLayer = this.layer;
    }

    ScreenMainMenu.prototype.init = function() {
      return this.layer.center();
    };

    ScreenMainMenu.prototype.play = function() {};

    return ScreenMainMenu;

  })(ScreenBase);

  module.exports = ScreenMainMenu;

}).call(this);

},{"./ScreenBase":9}]},{},[2]);
