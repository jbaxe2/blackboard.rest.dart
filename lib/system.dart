library blackboard.rest.system;

import 'dart:async' show Future;

import 'src/oauth2/access_token.dart';

import 'src/system/bb_rest_system.dart';
import 'src/system/version_info.dart';

/// The [getSystemInstance] method...
System getSystemInstance (String host, AccessToken token) =>
  new BbRestSystem (host, token);

/// The [System] abstract class...
abstract class System {
  /// The [getVersion] abstract method...
  Future<VersionInfo> getVersion();
}
