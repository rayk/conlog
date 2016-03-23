library consumersConfiguration;

/// This is what a user would normal setup with this library.
/// For a full explanation see the examples.

import 'package:conlog/configure.dart';
export 'package:conlog/configure.dart' show RuntimeMode;

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


Function defConfigs(ConfigLabel configuration, RuntimeMode runtime) {
  register(ConfigLabel.common, _commonConfiguration, RuntimeMode.Develop,
      fallback: true);
  register(ConfigLabel.common, _commonConfiguration, RuntimeMode.Diagnose);
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Develop);
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Diagnose);
  register(ConfigLabel.northern, _northernConfiguration, RuntimeMode.Deploy);
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

num _zipClassify(Function getValueFunction) {
  int h = getValueFunction(ConfigValue.intHeight);
  int w = getValueFunction(ConfigValue.intWidth);
  num v = getValueFunction(ConfigValue.numVolume);
  return h * w * v;
}

enum ConfigLabel {
  common, // Good in any situation.
  northern, // use only in the north.
  southern, // Use only in the south.
}

enum ConfigValue {
  boolFloat, // Does the thing actually flow.
  funClass, // Hows a function that is directly returned.
  intHeight, // Height in whole meters, line comments are not reformatted.
  intLength, // Short line comments can be used for IDE quick definitions.
  intWidth, // Width in whole meters.
  numVolume, // Line comment also makes sorting the enumerations easier.
  strType, // That is another pet hate, unsorted stuff.
}
