@TestOn('vm')
library blackboard.rest.tests.oauth2;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/_scaffolding/error/improper_authorization.dart';

import 'package:blackboard.rest/src/oauth2/access_token.dart';
import 'package:blackboard.rest/src/oauth2/bb_rest_oauth2.dart';

import '../testable.dart';

import 'oauth2_connection_info.dart';

/// The [OAuth2Tester] class...
class OAuth2Tester implements Testable {
  /// The [OAuth2Tester] constructor...
  OAuth2Tester();

  /// The [run] method...
  @override
  void run() {
    group ('OAuth2:', () {
      _testObtainRequestedToken();
      _testInvalidClientInfoFailsToObtainToken();
    });
  }

  /// The [_testObtainRequestedToken] method...
  void _testObtainRequestedToken() {
    test ('Request a token and obtain it.', () async {
      var bbRestOAuth = new BbRestOAuth2 (Uri.parse (host), clientId, secret);

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
      var bbRestOAuth = new BbRestOAuth2 (Uri.parse (host), 'badclientid', 'secret');

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
