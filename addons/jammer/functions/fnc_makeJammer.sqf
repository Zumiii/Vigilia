#include "script_component.hpp"

params [
  ["_logic", objNull, [objNull]],
  ["_jammers", [], [[]]],
  ["_activated", true, [true]]
];

if (!_activated) exitWith {};

private _active = _logic getVariable [QGVAR(active), true];
private _totalJammRange = _logic getVariable [QGVAR(totalJammRange), QGVAR(RadioTotalJammingDistance)];
private _partialJammRange = _logic getVariable [QGVAR(partialJammRange), QGVAR(RadioPartialJammingDistance)];
private _JammStrength = _logic getVariable [QGVAR(JammStrength), QGVAR(RadioJammingStrength)];
private _jammIEDs = _logic getVariable [QGVAR(IEDsJamming), QGVAR(jammIEDs)];
private _JammIEDsRange = _logic getVariable [QGVAR(JammIEDsRange), QGVAR(IEDJammingDistance)];

{
  if (hasInterface) then {

      private _jammer_an = ["Jammer_An", LLSTRING(Enable),["\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa","#41FA01"],{
        params ["_t","_p","_actionparams"];
        //["Jammer eingeschaltet...", "\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa", [0, 1, 0.5], _p, 2] call ace_common_fnc_displayTextPicture;
        playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", _t, false, getPosASL _t, 5, 15, 25];
        [QGVAR(jammer), [(vehicle _t), true]] call CBA_fnc_serverEvent;
        _t setVariable [QGVAR(jammerCharged), true, true];
        _t setVariable [QGVAR(isJamming), true, true];
        [
          {
            params [["_jammingObject", objNull]];
            if !(alive _jammingObject) exitWith {};
            _jammingObject setVariable [QGVAR(jammerCharged), false, true];
          },
          [_t],
          3
        ] call CBA_fnc_waitAndExecute;
      },{!(_target getVariable [QGVAR(isJamming), false]) && !(_target getVariable [QGVAR(jammerCharged), false])}, {}, [], [0,0,0], 2] call ace_interact_menu_fnc_createAction;

      private _jammer_aus = ["Jammer_Aus", LLSTRING(Disable),["\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa","#FF2D00"],{
        params ["_t","_p","_actionparams"];
        playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", _t, false, getPosASL _t, 5, 0.5, 50];
        _t setVariable [QGVAR(jammerCharged), true, true];
        _t setVariable [QGVAR(isJamming), false, true];
        [QGVAR(jammer), [_t, false]] call CBA_fnc_serverEvent;
        [
          {
            params [["_jammingObject", objNull]];
            if !(alive _jammingObject) exitWith {};
            _jammingObject setVariable [QGVAR(jammerCharged), false, true];
          },
          [_t],
          3
        ] call CBA_fnc_waitAndExecute;

      },{(_target getVariable [QGVAR(isJamming), false]) && !(_target getVariable [QGVAR(jammerCharged), false])}, {}, [], [0,0,0], 2] call ace_interact_menu_fnc_createAction;

      [_x, 0, ["ACE_MainActions"], _jammer_an] call ace_interact_menu_fnc_addActionToObject;
      [_x, 0, ["ACE_MainActions"], _jammer_aus] call ace_interact_menu_fnc_addActionToObject;
  };

  if (isServer) then {
    _x setVariable [QGVAR(RadioTotalJammingDistance), _totalJammRange, true];
    _x setVariable [QGVAR(RadioPartialJammingDistance), _partialJammRange, true];
    _x setVariable [QGVAR(RadioJammingStrength), _JammStrength, true];
    _x setVariable [QGVAR(jammIEDs), _jammIEDs, true];
    _x setVariable [QGVAR(IEDJammingDistance), _JammIEDsRange, true];
    if (_active) then {
      _x setVariable [QGVAR(jammerCharged), true, true];
      _x setVariable [QGVAR(isJamming), true, true];
      [
        {
          params [["_jammingObject", objNull]];
          if !(alive _jammingObject) exitWith {};
          _jammingObject setVariable [QGVAR(jammerCharged), false, true];
        },
        [_x],
        3
      ] call CBA_fnc_waitAndExecute;
      GVAR(jammers) pushBackUnique _x;
      publicVariable QGVAR(jammers);
    };
  };

} forEach _jammers;




true
