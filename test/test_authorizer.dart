library blackboard.rest.tests.authorizer;

import 'dart:async' show Future;

import 'package:blackboard.rest/src/_scaffolding/configuration/oauth2_connection_info.dart';
export 'package:blackboard.rest/src/_scaffolding/configuration/oauth2_connection_info.dart'
  show host;

import 'package:blackboard.rest/src/oauth2/access_token.dart';
import 'package:blackboard.rest/src/oauth2/bb_rest_oauth2.dart';

/// The [TestAuthorizer] class...
class TestAuthorizer {
  /// The [TestAuthorizer] constructor...
  TestAuthorizer();

  /// The [authorizeForTests] method...
  Future<AccessToken> authorizeForTests() async {
    var bbRestOAuth = new BbRestOAuth2 (Uri.parse (host), clientId, secret);

    return await bbRestOAuth.requestToken ('client_credentials');
  }
}
