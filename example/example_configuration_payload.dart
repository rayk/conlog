/// Place all your configuration for module into it's own library.
library exampleConfigurations;

import 'package:conlog/configure.dart';

export 'package:conlog/configure.dart' show RuntimeMode;

/// Example configuration payload is built from a constant lookup map.
LookupMap _commonConfiguration = const LookupMap(const [
  ConfigValue.intHeight,
  323,
  ConfigValue.intLength,
  4827,
  ConfigValue.intWidth,
  39,
  ConfigValue.boolFloat,
  true,
  ConfigValue.numVolume,
  2938.1293,
  ConfigValue.strType,
  "World ZipCatch Bot",
  ConfigValue.funClass,
  _zipClassify,
]);

/// A final example for good measure.
LookupMap _northernConfiguration = const LookupMap(const [
  ConfigValue.intHeight,
  214,
  ConfigValue.intLength,
  651,
  ConfigValue.intWidth,
  40,
  ConfigValue.boolFloat,
  true,
  ConfigValue.numVolume,
  824.39,
  ConfigValue.strType,
  "Bot North zip Bot",
  ConfigValue.funClass,
  _zipClassify,
]);

/// A second example configuration payload, stands alone from the rest.
LookupMap _southernConfiguration = const LookupMap(const [
  ConfigValue.intHeight,
  490,
  ConfigValue.intLength,
  5000,
  ConfigValue.intWidth,
  30,
  ConfigValue.boolFloat,
  true,
  ConfigValue.numVolume,
  123343.1293,
  ConfigValue.strType,
  "Southen ZipCatch Bot",
  ConfigValue.funClass,
  _zipClassify,
]);

/// Returns a function which can be used get configuration values as they have been defined.
///
/// The register function allows mapping of configuration set names with runtime context
/// and the actual lookup map containing the values.
Function defConfigs(ConfigLabel configuration, RuntimeMode runtime) {
  register(ConfigLabel.common, _commonConfiguration, RuntimeMode.Develop,
      fallback: true);
  register(ConfigLabel.common, _commonConfiguration, RuntimeMode.Diagnose);

  /// Northern is also available.
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Develop);
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Diagnose);
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Deploy);

  /// SouthernConfiguration is only available in Diagnose and Deploy
  register(ConfigLabel.southern, _southernConfiguration, RuntimeMode.Diagnose);
  register(ConfigLabel.southern, _southernConfiguration, RuntimeMode.Deploy);

  LookupMap configValueBase = configSets(configuration.index, runtime.index);

  getConfigValue(ConfigValue requestedValue) {
    var value = configValueBase[requestedValue];
    assert(value != null);
    return value;
  }

  return getConfigValue;
}

/// Example classification function we will have in our Config values. As long
/// as the function is completely complied time constant there will be
/// Any issues. This approach can be leveraged to dry up your configurations
/// should you find it required.
num _zipClassify(Function getValueFunction) {
  int h = getValueFunction(ConfigValue.intHeight);
  int w = getValueFunction(ConfigValue.intWidth);
  num v = getValueFunction(ConfigValue.numVolume);
  return h * w * v;
}

/// This enum holds the names of the configuration payloads, also with a comment
/// about when it is appropriate to use the set.
enum ConfigLabel {
  common, // Good in any situation.
  northern, // use only in the north.
  southern, // Use only in the south.
}

/// Definition of our configuration values so there is no doubt about what they are.
/// A particular module would probably have one of these. There can be more but it
/// can be indication of some mixed modeling going on.
enum ConfigValue {
  boolFloat, // Does the thing actually flow.
  funClass, // Hows a function that is directly returned.
  intHeight, // Height in whole meters, line comments are not reformatted.
  intLength, // Short line comments can be used for IDE quick definitions.
  intWidth, // Width in whole meters.
  numVolume, // Line comment also makes sorting the enumerations easier.
  strType, // That is another pet hate, unsorted stuff.
}
