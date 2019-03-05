library blackboard.rest.system;

import 'dart:async' show Future;

import 'src/system/version.dart';

/// The [System] abstract class...
abstract class System {
  /// The [getVersion] abstract method...
  Future<Version> getVersion();
}
