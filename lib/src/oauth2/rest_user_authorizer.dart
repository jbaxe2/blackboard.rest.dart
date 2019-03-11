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
  _RestUserAuthorizer (Uri host, String clientId, String secret) :
    super (host, clientId, secret);

  /// The [requestAuthorizationCode] method...
  @override
  Future<void> requestAuthorizationCode (String redirectUri) async {
    await html.loadLibrary();

    String authorizeUriStr = '$host$base${oauth2['authorization_code']}'
      '?redirect_uri=${Uri.encodeFull (redirectUri)}&client_id=$clientId'
      '&response_type=code&scope=read';

    html.window.location.replace (authorizeUriStr);
  }

  /// The [requestUserAuthorization] method...
  @override
  Future<AccessToken> requestUserAuthorization (
    String authCode, String redirectUri
  ) async {
    await io.loadLibrary();

    String authCodeUriStr = '$host$base${oauth2['request_token']}'
      '&code=$authCode&redirect_uri=${Uri.encodeFull (redirectUri)}';

    String encodedAuth = (new Base64Encoder()).convert (
      '$clientId:$secret'.codeUnits
    );

    http.Response tokenResponse;

    try {
      tokenResponse = await http.post (
        Uri.parse (authCodeUriStr),
        headers: {
          io.HttpHeaders.authorizationHeader: 'Basic $encodedAuth',
          io.HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
        },
        body: 'grant_type=authorization_code'
      );
    } catch (e) {
      throw new ImproperAuthorization (e.toString());
    }

    return _parseRawToken (json.decode (tokenResponse.body));
  }

  /// The [_parseRawToken] method...
  @override
  AccessToken _parseRawToken (Map<String, String> rawToken) {
    return new AccessToken (
      rawToken['access_token'], rawToken['token_type'],
      int.parse (rawToken['expires_in']),
      rawToken['refresh_token'], rawToken['scope'], rawToken['user_id']
    );
  }
}
