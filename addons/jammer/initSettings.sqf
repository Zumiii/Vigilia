

[
    QGVAR(enabled),
    "CHECKBOX",
    [LLSTRING(enableSetting), LLSTRING(enableSetting_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    true,
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(jammerClasses),
    "EDITBOX",
    [LLSTRING(settingsjammerClasses), LLSTRING(settingsjammerClasses_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    "[]",
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(RadioTotalJammingDistance),
    "SLIDER",
    [LLSTRING(settingsRadioTotalJammingDistance), LLSTRING(settingsRadioTotalJammingDistance_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    [RADIO_TOTAL_JAMMING_MIN_DISTANCE, RADIO_TOTAL_JAMMING_MAX_DISTANCE, RADIO_TOTAL_JAMMING_DEFAULT_DISTANCE, TRAILING_DECIMALS],
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(RadioPartialJammingDistance),
    "SLIDER",
    [LLSTRING(settingsRadioPartialJammingDistance), LLSTRING(settingsRadioPartialJammingDistance_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    [RADIO_PARTIAL_JAMMING_MIN_DISTANCE, RADIO_PARTIAL_JAMMING_MAX_DISTANCE, RADIO_PARTIAL_JAMMING_DEFAULT_DISTANCE, TRAILING_DECIMALS],
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(RadioJammingStrength),
    "SLIDER",
    [LLSTRING(settingsRadioJammingStrength), LLSTRING(settingsRadioJammingStrength_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    [0, 1, 1, TRAILING_DECIMALS, true],
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(jammIEDs),
    "CHECKBOX",
    [LLSTRING(settingsjammIEDs), LLSTRING(settingsjammIEDs_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    true,
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;

[
    QGVAR(IEDJammingDistance),
    "SLIDER",
    [LLSTRING(settingsIEDJammingDistance), LLSTRING(settingsIEDJammingDistance_tooltip)],
    [LLSTRING(Category), LLSTRING(subCategory)],
    [IED_JAMMING_MIN_DISTANCE, IED_JAMMING_MAX_DISTANCE, IED_JAMMING_DEFAULT_DISTANCE, TRAILING_DECIMALS],
    IS_SERVER_SETTINGS
] call CBA_fnc_addSetting;
