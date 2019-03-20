library blackboard.rest.implementation.system;

import 'dart:async' show Future;

import '../../system.dart';

import '../_scaffolding/configuration/endpoints.dart' show system;
import '../_scaffolding/error/invalid_version.dart';
import '../_scaffolding/factory/system_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import '../system/version_info.dart';

/// The [BbRestSystem] class...
class BbRestSystem extends BlackboardRestServices implements System {
  /// The [BbRestSystem] constructor...
  BbRestSystem (String host, AccessToken token) : super (host, token);

  /// The [getVersion] method...
  @override
  Future<VersionInfo> getVersion() async {
    Object rawVersion;

    try {
      rawVersion = await connector.sendBbRestRequest (system['get_version']);
    } catch (e) {
      throw e as InvalidVersion;
    }

    return (new SystemFactory()).create (rawVersion);
  }
}
