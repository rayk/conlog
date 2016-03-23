library configure_api;

import 'package:darpule/tuple.dart';
import 'package:lookup_map/lookup_map.dart';

export 'package:lookup_map/lookup_map.dart';

LookupMap _fallback;

/// Holds the runtime payload configuration LookUps
List<Tuple> _registeredConfigurations = new List();

/// Builds up the registrations of the of configurations set that you would like
/// to have available. By using the optional fallback parameter to a determine
/// which configuration is used if one is asked for in a runtime context that
/// does not exist..
void register(
    var payloadName, LookupMap configurationPayload, RuntimeMode runtime,
    {bool fallback: false}) {
  _registeredConfigurations.add(
      new Tuple([payloadName.index, runtime.index, configurationPayload,]));
  if (fallback) {
    _fallback = configurationPayload;
  }
  assert(_registeredConfigurations.isNotEmpty);
}

/// Returns a lookup map with the configuration values for configuration and
/// the runtime. If one can not be located, the fallback is used. Should that
/// not of been set then last configuration to be registered is used.
LookupMap configSets(int registrationIdx, int runtimeModeIdx) {
  LookupMap _result;

  for (Tuple registration in _registeredConfigurations) {
    if (registration[0] == registrationIdx &&
        registration[1] == runtimeModeIdx) {
      _result = registration[2];
    }
  }

  if (_result == null) {
    if (_fallback == null) {
      Tuple lastConfig = _registeredConfigurations.last;
      _result = lastConfig[2];
    } else {
      _result = _fallback;
    }
  }
  assert(_result != null);
  return _result;
}

/// Denotes the three simple context for which an application can be executing in.
/// Used also to control logging levels.
///
/// #### Note
/// the documentation may show the first enumeration as having a
/// constant runtime value of 1. It is actually zero based the problem is with
/// documentation system. It do like counting from zero
enum RuntimeMode {
  Deploy, // Complete information at the point that something is not right.
  Develop, // Development environment no connection to live systems, full exposure.
  Diagnose, // Call flow and states without exposing data.
}
