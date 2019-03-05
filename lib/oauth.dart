library blackboard.rest.oauth;

import 'dart:async' show Future;

import 'src/oauth/access_token.dart';

/// The [BlackboardRestOAuth2] abstract class...
abstract class BlackboardRestOAuth2 {
  /// The [getAuthorizationCode] abstract method...
  Future<void> getAuthorizationCode (
    Uri redirect_uri, String response_type, String client_id,
    {String scope, String state}
  );

  /// The [requestToken] method...
  Future<AccessToken> requestToken();
}
