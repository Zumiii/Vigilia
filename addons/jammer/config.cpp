
#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT_NAME;
    units[] = {QGVAR(Jammermodule)};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"vigilia_main","ace_interact_menu","ace_explosives","acre_sys_signal","acre_api"};
    author = "Zumi";
    url = "";
    VERSION_CONFIG;
  };
};

class CfgFactionClasses {
    class NO_CATEGORY;
    class GVAR(Modules): NO_CATEGORY {
        displayName = CSTRING(subCategory);
    };
};

#include "cfgVehicles.hpp"
#include "cfgEventHandlers.hpp"
