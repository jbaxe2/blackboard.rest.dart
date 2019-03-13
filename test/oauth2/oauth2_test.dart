@TestOn('vm')
library blackboard.rest.tests.oauth2;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/_scaffolding/configuration/oauth2_connection_info.dart';
import 'package:blackboard.rest/src/_scaffolding/error/improper_authorization.dart';

import 'package:blackboard.rest/src/oauth2/access_token.dart';
import 'package:blackboard.rest/src/oauth2/bb_rest_oauth2.dart';

import 'package:blackboard.rest/oauth2.dart';

import '../testable.dart';

/// The [OAuth2Tester] class...
class OAuth2Tester implements Testable {
  /// The [OAuth2Tester] constructor...
  OAuth2Tester();

  /// The [run] method...
  @override
  void run() {
    group ('OAuth2:', () {
      _testGetValidOAuth2Instance();
      _testObtainRequestedToken();
      _testInvalidClientInfoFailsToObtainToken();
    });
  }

  /// The _testGetValidOAuth2Instance] method...
  void _testGetValidOAuth2Instance() {
    test ('Obtain a valid OAuth2 instance.', () async {
      BlackboardRestOAuth2 bbRestOAuth = getOAuth2Instance (
        Uri.parse (host), clientId, secret
      );

      expect ((bbRestOAuth is BbRestOAuth2), true);
    });
  }

  /// The [_testObtainRequestedToken] method...
  void _testObtainRequestedToken() {
    test ('Request a token and obtain it.', () async {
      BlackboardRestOAuth2 bbRestOAuth = getOAuth2Instance (
        Uri.parse (host), clientId, secret
      );

      AccessToken token;
      var error;

      try {
        token = await bbRestOAuth.requestToken ('client_credentials');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      expect ((null == token), false);
    });
  }

  /// The [_testInvalidClientInfoFailsToObtainToken] method...
  void _testInvalidClientInfoFailsToObtainToken() {
    test ('Obtaining a token fails with invalid client info.', () async {
      BlackboardRestOAuth2 bbRestOAuth = getOAuth2Instance (
        Uri.parse (host), 'badclientid', 'secret'
      );

      AccessToken token;
      Exception error;

      final String errorMsg =
        'Invalid client credentials, or no access granted to this Learn server.';

      try {
        token = await bbRestOAuth.requestToken ('client_credentials');
      } catch (e) {
        error = e;
      }

      assert (null == token);
      assert (null != error);
      assert (error is ImproperAuthorization);

      expect ((errorMsg == (error as ImproperAuthorization).message), true);
    });
  }
}
