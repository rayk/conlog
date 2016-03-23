/// Shows how to use the configurations.
library exampleUseCases;

/// We import our configuration library that contains all our configurations
/// but there are no direct access to the configurations.

import 'example_configuration_payload.dart';

main() {

  /// Get a hold of the configuration set you want to use.
  Function use = defConfigs(ConfigLabel.northern, RuntimeMode.Diagnose);

  /// That is it we can start to use it.
  String knownType = use(ConfigValue.strType);
  int height = use(ConfigValue.intHeight);
  int width = use(ConfigValue.intWidth);
  int length = use(ConfigValue.intLength);
  num volume = use(ConfigValue.numVolume);
  bool floats = use(ConfigValue.boolFloat);
  Function classifier = use(ConfigValue.funClass);

  /// Passing in the use function so that classifier can access config Values.
  num total = classifier(use);

 /// That is all that is required.
  print('Knowntype: $knownType');
  print('Height: $height');
  print('Width: $width');
  print('Length: $length');
  print('Volume: $volume');
  print('Floating: $floats');
  print('Total Calculation: ${classifier(use)}');

}
