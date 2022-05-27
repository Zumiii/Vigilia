

class cfgVehicles {

  class Logic;
  class Module_F: Logic {
      class AttributesBase {
        class Default;
        class Edit;
        class Combo;
        class Checkbox;
        class CheckboxNumber;
        class ModuleDescription;
        class Units;
      };
      class ModuleDescription;
  };

  class GVAR(ModuleBase): Module_F {};

  class GVAR(Jammermodule): GVAR(ModuleBase) {
    category = QGVAR(Modules);
    author = "Zumi";
    displayName = CSTRING(Displayname);
    description = CSTRING(Description);
    function = QFUNC(makeJammer);
    isGlobal = 0;
    isTriggerActivated = 0;
    scope = 2;

    class Attributes: AttributesBase {

      class GVAR(Active): Checkbox {
          property = QGVAR(setupModule_Active);
          displayName = CSTRING(settingsActive);
          typeName = "BOOL";
          defaultValue = "true";
      };

      class GVAR(totalJammRange): Edit {
          property = QGVAR(setupModule_totalJammRange);
          displayName = CSTRING(settingsRadioTotalJammingDistance);
          typeName = "NUMBER";
          defaultValue = 500;
      };

      class GVAR(partialJammRange): Edit {
          property = QGVAR(setupModule_partialJammRange);
          displayName = CSTRING(settingsRadioPartialJammingDistance);
          typeName = "NUMBER";
          defaultValue = 2500;
      };

      class GVAR(JammStrength): Combo {
          displayName = CSTRING(settingsRadioJammingStrength);
          property = QGVAR(setupModule_JammStrength);
          typeName = "NUMBER";
          defaultValue = 1;
          class values {
              class full {
                  name = "100 %";
                  value = 1;
              };
              class strong {
                  name = "75 %";
                  value = 0.75;
              };
              class medium {
                  name = "50 %";
                  value = 0.5;
              };
              class weak {
                  name = "25 %";
                  value = 0.25;
              };
          };
      };

      class GVAR(IEDsJamming): Checkbox {
          property = QGVAR(setupModule_jammIEDs);
          displayName = CSTRING(settingsjammIEDs);
          typeName = "BOOL";
          defaultValue = "true";
      };

      class GVAR(JammIEDsRange): Edit {
          property = QGVAR(setupModule_JammIEDsRange);
          displayName = CSTRING(settingsIEDJammingDistance);
          typeName = "NUMBER";
          defaultValue = 150;
      };


    };

    class ModuleDescription: ModuleDescription {
        description = "This module can be synced to objects only.";
        sync[] = {};
    };

  };

};
