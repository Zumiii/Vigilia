#include "script_component.hpp"

["CBA_settingsInitialized", {

    if (!(GVAR(enabled))) exitWith {};

    GVAR(jammerClasses) = toLower GVAR(jammerClasses);
    GVAR(jammerClasses) = GVAR(jammerClasses) splitString "[,""']";

		if (isServer) then {

			[QGVAR(jammer), {
				params [["_jammer", nil], ["_an", false]];
				if (_an) exitWith {
					GVAR(jammers) pushBackUnique _jammer;
					publicVariable QGVAR(jammers);
				};
				_index = GVAR(jammers) find _jammer;
				if (_index >= 0) then {
					GVAR(jammers) deleteAt _index;
					publicVariable QGVAR(jammers);
				};
			}] call CBA_fnc_addEventHandler;

		};


		if (hasInterface) then {

			[{
			    // ACRE signal processing
			    private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
			    _coreSignal params ["_Px", "_maxSignal"];

					if (((GVAR(jammers)) select {alive _x}) isNotEqualTo []) then {
					    // Modify signal : Find nearest Jammer
							private _closestJammer = [GVAR(jammers), {-(acre_player distance2d _x)}, objNull] call CBA_fnc_selectBest;
							if (isNull _closestJammer) exitwith {
								[_Px, _maxSignal]
							};
							// Calculate Signal
							_Px = linearConversion [(_closestJammer getVariable [QGVAR(RadioTotalJammingDistance), GVAR(RadioTotalJammingDistance)]) * (_closestJammer getVariable [QGVAR(RadioJammingStrength), GVAR(RadioJammingStrength)]), ((_closestJammer getVariable [QGVAR(RadioPartialJammingDistance), GVAR(RadioPartialJammingDistance)]) max (_closestJammer getVariable [QGVAR(RadioTotalJammingDistance), GVAR(RadioTotalJammingDistance)])) * (_closestJammer getVariable [QGVAR(RadioJammingStrength), GVAR(RadioJammingStrength)]), acre_player distance2d _closestJammer, 0, _Px, true];
					};
			    // Return final signal
			    [_Px, _maxSignal]
			}] call acre_api_fnc_setCustomSignalFunc;


			_jammer_an = ["Jammer_An", LLSTRING(Enable),["\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa","#41FA01"],{
		 		params ["_t","_p","_actionparams"];
		 		//["Jammer eingeschaltet...", "\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa", [0, 1, 0.5], _p, 2] call ace_common_fnc_displayTextPicture;
		 		playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", (vehicle _t), false, getPosASL (vehicle _t), 5, 15, 25];
		 		[QGVAR(jammer), [(vehicle _t), true]] call CBA_fnc_serverEvent;
				(vehicle _t) setVariable [QGVAR(jammerCharged), true, true];
				(vehicle _t) setVariable [QGVAR(isJamming), true, true];
		 		[
		 			{
		 				params [["_jammingVehicle", objNull]];
		 				if !(alive _jammingVehicle) exitWith {};
		 				_jammingVehicle setVariable [QGVAR(jammerCharged), false, true];
		 			},
		 			[(vehicle _t)],
		 			3
		 		] call CBA_fnc_waitAndExecute;
		 	},{(([_player] call cba_fnc_vehicleRole) == "driver") && !(_target getVariable [QGVAR(isJamming), false]) && !(_target getVariable [QGVAR(jammerCharged), false]) && (isEngineOn _target)}, {}, [], [0,0,0], 2] call ace_interact_menu_fnc_createAction;

      {
        [_x, 1, ["ACE_SelfActions"], _jammer_an, true] call ace_interact_menu_fnc_addActionToClass;
      } forEach GVAR(jammerClasses);

		 	_jammer_aus = ["Jammer_Aus", LLSTRING(Disable),["\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa","#FF2D00"],{
		 		params ["_t","_p","_actionparams"];
		 		//["Jammer ausgeschaltet...", "\idi\acre\addons\sys_oe303\data\ui\icon_antenna_ca.paa", [1, 0, 0], _p, 2] call ace_common_fnc_displayTextPicture;
		 		playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", (vehicle _t), false, getPosASL (vehicle _t), 5, 0.5, 50];
		 		(vehicle _t) setVariable [QGVAR(jammerCharged), true, true];
		 		(vehicle _t) setVariable [QGVAR(isJamming), false, true];
		 		[QGVAR(jammer), [(vehicle _t), false]] call CBA_fnc_serverEvent;
		 		[
		 			{
		 				params [["_jammingVehicle", objNull]];
		 				if !(alive _jammingVehicle) exitWith {};
		 				_jammingVehicle setVariable [QGVAR(jammerCharged), false, true];
		 			},
		 			[(vehicle _t)],
		 			3
		 		] call CBA_fnc_waitAndExecute;

		 	},{(([_player] call cba_fnc_vehicleRole) == "driver") && (_target getVariable [QGVAR(isJamming), false]) && !(_target getVariable [QGVAR(jammerCharged), false]) && (isEngineOn _target)}, {}, [], [0,0,0], 2] call ace_interact_menu_fnc_createAction;

      {
        [_x, 1, ["ACE_SelfActions"], _jammer_aus, true] call ace_interact_menu_fnc_addActionToClass;
      } forEach GVAR(jammerClasses);

       {
         [_x, "Engine", {
   		      params ["_vehicle", "_engineState"];
             if ((_engineState) || !(_vehicle getVariable [QGVAR(isJamming), false]) || !(alive _vehicle)) exitWith {};
             playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", _vehicle, false, getPosASL _vehicle, 5, 0.5, 50];
     		 		_vehicle setVariable [QGVAR(jammerCharged), true, true];
     		 		_vehicle setVariable [QGVAR(isJamming), false, true];
     		 		[QGVAR(jammer), [_vehicle, false]] call CBA_fnc_serverEvent;
     		 		[
     		 			{
     		 				params [["_jammingVehicle", objNull]];
     		 				if !(alive _jammingVehicle) exitWith {};
     		 				_jammingVehicle setVariable [QGVAR(jammerCharged), false, true];
     		 			},
     		 			[_vehicle],
     		 			3
     		 		] call CBA_fnc_waitAndExecute;
   	    }, true, [], true] call CBA_fnc_addClassEventHandler;
      } forEach GVAR(jammerClasses);

		};

		if (!(GVAR(jammIEDs))) exitWith {};

		[{
				params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
				if !(local _unit) exitWith {};
				if ({(_x distance2d _explosive <= (_x getVariable [QGVAR(IEDJammingDistance), GVAR(IEDJammingDistance)])) || (_x distance2d _unit <= (_x getVariable [QGVAR(IEDJammingDistance), GVAR(IEDJammingDistance)]))} count GVAR(jammers) < 1) exitWith {
					true;
				};
				if (_triggerItem IN ["ACE_Cellphone", "ACE_M26_Clacker", "ACE_Clacker", "ACE_DeadManSwitch"]) exitWith {
					false;
				};
				true;
		}] call ace_explosives_fnc_addDetonateHandler;

}] call CBA_fnc_addEventHandler;
