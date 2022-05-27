#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
  GVAR(jammers) = [];
  publicVariable QGVAR(jammers);
};

#include "initSettings.sqf"

ADDON = true;
