// Generated by CoffeeScript 1.9.2
(function() {
  var MasterProjectsDelegate, ProjectsMenuDelegate_1067x584, ScreenDelegateBase, ScreenMasterProjects,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ScreenMasterProjects = require("../screens/ScreenMasterProjects_1067x584");

  ScreenDelegateBase = require("./ScreenDelegateBase_1067x584");

  MasterProjectsDelegate = require("./MasterProjectsDelegate_1067x584");

  ProjectsMenuDelegate_1067x584 = (function(superClass) {
    extend(ProjectsMenuDelegate_1067x584, superClass);

    function ProjectsMenuDelegate_1067x584(options) {
      this.afterButtonMasterPlanProjectsClicked = bind(this.afterButtonMasterPlanProjectsClicked, this);
      this.afterButtonOfficeBuildingClicked = bind(this.afterButtonOfficeBuildingClicked, this);
      this.afterButtonResortsClicked = bind(this.afterButtonResortsClicked, this);
      this.afterButtonResidentialClicked = bind(this.afterButtonResidentialClicked, this);
      ProjectsMenuDelegate_1067x584.__super__.constructor.call(this, options);
      this.delay = 0.5;
    }

    ProjectsMenuDelegate_1067x584.prototype.afterButtonResidentialClicked = function() {
      return this.afterButtonMasterPlanProjectsClicked();
    };

    ProjectsMenuDelegate_1067x584.prototype.afterButtonResortsClicked = function() {
      return this.afterButtonMasterPlanProjectsClicked();
    };

    ProjectsMenuDelegate_1067x584.prototype.afterButtonOfficeBuildingClicked = function() {
      return this.afterButtonMasterPlanProjectsClicked();
    };

    ProjectsMenuDelegate_1067x584.prototype.afterButtonMasterPlanProjectsClicked = function() {
      return Utils.delay(this.delay, (function(_this) {
        return function() {
          return _this.afterButtonMenuClicked(function() {
            _this.mainMenuScreen.subMenuScreen = new ScreenMasterProjects({
              parent_screen: _this.mainMenuScreen
            });
            _this.mainMenuScreen.subMenuScreen.delegate = new MasterProjectsDelegate(_this.mainMenuScreen, _this);
            return _this.mainMenuScreen.subMenuScreen.afterBackButtonClicked = function() {
              return _this.mainMenuScreen.delegate.afterProjectsButtonClicked();
            };
          });
        };
      })(this));
    };

    return ProjectsMenuDelegate_1067x584;

  })(ScreenDelegateBase);

  module.exports = ProjectsMenuDelegate_1067x584;

}).call(this);
