part of blackboard.rest.oauth2.authorizer;

/// The [RestUserAuthorizer] abstract class...
abstract class RestUserAuthorizer extends RestAuthorizer {
  /// The [requestAuthorizationCode] method...
  Future<void> requestAuthorizationCode (String redirectUri);

  /// The [requestUserAuthorization] abstract method...
  Future<AccessToken> requestUserAuthorization (
    String authCode, String redirectUri
  );
}

/// The [_RestUserAuthorizer] class...
class _RestUserAuthorizer extends _RestAuthorizer implements RestUserAuthorizer {
  /// The [_RestUserAuthorizer] constructor...
  _RestUserAuthorizer (String clientId, String secret) : super (clientId, secret);

  /// The [requestAuthorizationCode] method...
  @override
  Future<void> requestAuthorizationCode (String redirectUri) async {
    ;
  }

  /// The [requestUserAuthorization] method...
  @override
  Future<AccessToken> requestUserAuthorization (
    String authCode, String redirectUri
  ) async {
    AccessToken token;

    return token;
  }
}
