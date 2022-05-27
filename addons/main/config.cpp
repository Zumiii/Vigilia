#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = COMPONENT_NAME;
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"cba_main", "ace_main"};
    author = "Zumi";
    url = "https://github.com/Zumiii/OP-Vigilia";
    VERSION_CONFIG;
  };
};

class CfgMods {
    class PREFIX {
        dir = "@vigilia";
        name = "Vigilia";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = 0;
        hideName = 0;
        actionName = "GitHub";
        url = "https://github.com/Zumiii/OP-Vigilia";
        description = "Issue Tracker: https://github.com/Zumiii/OP-Vigilia/issues";
    };
};
