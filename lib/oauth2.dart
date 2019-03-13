library blackboard.rest.oauth2;

import 'dart:async' show Future;
import 'dart:io' show HttpResponse;

import 'src/oauth2/access_token.dart';

/// The [BlackboardRestOAuth2] abstract class...
abstract class BlackboardRestOAuth2 {
  /// The [getAuthorizationCode] abstract method...
  Future<void> getAuthorizationCode (
    Uri redirect_uri, String response_type, String client_id, HttpResponse response,
    {String scope, String state}
  );

  /// The [requestToken] method...
  Future<AccessToken> requestToken (String grant_type, [String code]);
}
