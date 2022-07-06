#include "script_component.hpp"


class cfgVehicles {

  class Box_IED_Exp_F;
  class GVAR(Miclic): Box_IED_Exp_F {
    author = "Zumi";
    ace_dragging_carryDirection = 180;
    ace_dragging_dragDirection = 180;
    displayName = CSTRING(Displayname);
    description = CSTRING(Description);
    maximumLoad = 0;
    class Transportmagazines {};
    class Transportbackpacks {};
    class Transportweapons {};
    class Transportitems {};
  };

};
