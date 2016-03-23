/// ### Configuration Library
///
/// So simple, check out the examples.
///
/// The deal is that you create a configuration library, importing ```configure.dart```
/// from the conlog package. Then create two Enums The first with labels for your
/// configuration sets. The second holds the configuration attribute names.
///
/// You can go about creating as many configuration sets as you like using the
/// LookupMap exposed in the API.
///
/// Then in the one closure function you need to create use thee```register()``` function,
/// to start your wiring. This is how you linkup your configuration sets to your
/// labels and to runtime modes.
///
/// The API also has a ```configSets()``` function that returns a LookupMap for
/// configuration set label (enum.index) this all takes the runtimeMode (enum.index).
/// Include this in your closure.
///
/// So when your closure is call the first time it does all the wiring with
/// that you defined with```register()```, before all tree shaking has already eliminated
/// the sets are not going to use. Then you return in your
/// closure function the lookupMap returned from  ```configSet()``` which
/// you use to back a simple lockup function which returns a value given then ConfigValue
/// enum name.
///
/// The working examples should how this works and hopefully it will avoid all those
/// hate items. It simple and It works.
library configure;

export 'package:conlog/src/configure_api.dart';
