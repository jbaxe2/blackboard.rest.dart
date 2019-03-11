library blackboard.rest.oauth2.authorizer;

import 'dart:async' show Future;
import 'dart:convert' show Base64Encoder, json;
import 'dart:html' deferred as html show window;
import 'dart:io' deferred as io show HttpHeaders;

import 'package:http/http.dart' as http;

import '../_scaffolding/configuration/endpoints.dart';
import '../_scaffolding/error/improper_authorization.dart';

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
    await io.loadLibrary();

    String authorizeStr = (new Base64Encoder()).convert (
      '$clientId:$secret'.codeUnits
    );

    http.Response tokenResponse;

    try {
      tokenResponse = await http.post (
        Uri.parse ('$host$base${oauth2['request_token']}'),
        headers: {
          io.HttpHeaders.authorizationHeader: 'Basic $authorizeStr',
          io.HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
        },
        body: 'grant_type=client_credentials'
      );
    } catch (e) {
      throw new ImproperAuthorization (e.toString());
    }

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
