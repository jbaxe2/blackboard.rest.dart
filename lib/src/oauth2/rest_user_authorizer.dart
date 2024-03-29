part of blackboard.rest.oauth2.authorizer;

/// The [RestUserAuthorizer] abstract class...
abstract class RestUserAuthorizer extends RestAuthorizer {
  /// The [requestAuthorizationCode] method...
  Future<void> requestAuthorizationCode (String redirectUri, HttpResponse response);

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
  Future<void> requestAuthorizationCode (
    String redirectUri, HttpResponse response
  ) async {
    String authorizeUriStr = '$host$base${oauth2['authorization_code']}'
      '?redirect_uri=${Uri.encodeFull (redirectUri)}&client_id=$clientId'
      '&response_type=code&scope=read';

    response.headers.add (HttpHeaders.locationHeader, authorizeUriStr);
    await response.close();
  }

  /// The [requestUserAuthorization] method...
  @override
  Future<AccessToken> requestUserAuthorization (
    String authCode, String redirectUri
  ) async {
    String encodedRedirect =
      (null == redirectUri) ? '' : '&redirect_uri=${Uri.encodeFull (redirectUri)}';

    String authCodeUriStr = '$host$base${oauth2['request_token']}'
      '?code=$authCode$encodedRedirect';

    String encodedAuth = (new Base64Encoder()).convert (
      '$clientId:$secret'.codeUnits
    );

    http.Response tokenResponse;

    try {
      tokenResponse = await http.post (
        Uri.parse (authCodeUriStr),
        headers: {
          HttpHeaders.authorizationHeader: 'Basic $encodedAuth',
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
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
  AccessToken _parseRawToken (Map<String, dynamic> rawToken) {
    return new AccessToken (
      rawToken['access_token'], rawToken['token_type'], rawToken['expires_in'],
      rawToken['refresh_token'], rawToken['scope'], rawToken['user_id']
    );
  }
}
