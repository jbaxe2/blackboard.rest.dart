library blackboard.rest.oauth2;

import 'dart:async' show Future;
import 'dart:io' show HttpResponse;

import 'src/oauth2/access_token.dart';
import 'src/oauth2/bb_rest_oauth2.dart';

export 'src/oauth2/access_token.dart';

/// The [getOAuth2Instance] function...
BlackboardRestOAuth2 getOAuth2Instance (
  Uri host, String clientId, String secret
) => new BbRestOAuth2 (host, clientId, secret);

/// The [BlackboardRestOAuth2] abstract class...
abstract class BlackboardRestOAuth2 {
  /// The [getAuthorizationCode] abstract method...
  Future<void> getAuthorizationCode (
    Uri redirect_uri, String response_type, HttpResponse response,
    {String scope, String state}
  );

  /// The [requestToken] method...
  Future<AccessToken> requestToken (
    String grant_type, [String code, Uri redirect_uri]
  );
}
