library blackboard.rest.oauth2.authorizer;

import 'dart:async' show Future;
import 'dart:convert' show Base64Encoder, json;
import 'dart:io' show HttpHeaders;

import 'package:http/http.dart' as http;

import 'access_token.dart';

part 'authorizer_factory.dart';
part 'rest_user_authorizer.dart';

/// The [RestAuthorizer] abstract class...
abstract class RestAuthorizer {
  /// The [requestAuthorization] abstract method...
  Future<AccessToken> requestAuthorization();
}

/// The [_RestAuthorizer] class...
class _RestAuthorizer implements RestAuthorizer {
  final Uri host;

  final String clientId;

  final String secret;

  /// The [_RestAuthorizer] constructor...
  _RestAuthorizer (this.host, this.clientId, this.secret);

  /// The [requestAuthorization] method...
  @override
  Future<AccessToken> requestAuthorization() async {
    String authorizeStr = (new Base64Encoder()).convert (
      '$clientId:$secret'.codeUnits
    );

    http.Response tokenResponse = await http.post (
      host,
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $authorizeStr',
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
      },
      body: 'grant_type=client_credentials'
    );

    return _parseRawToken (json.decode (tokenResponse.body));
  }

  /// The [_parseRawToken] method...
  AccessToken _parseRawToken (Map<String, String> rawToken) {
    return new AccessToken (
      rawToken['access_token'], rawToken['token_type'],
      int.parse (rawToken['expires_in']),
      null, null, null
    );
  }
}
