
#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT_NAME;
    units[] = {QGVAR(miclic)};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"vigilia_main","ace_common","ace_interact_menu","ace_explosives"};
    author = "Zumi";
    url = "";
    VERSION_CONFIG;
  };
};


#include "cfgVehicles.hpp"
#include "cfgEventHandlers.hpp"
