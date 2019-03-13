library blackboard.rest.implementation.oauth2;

import 'dart:async' show Future;
import 'dart:io' show HttpResponse;

import '../../oauth2.dart';

import '../_scaffolding/error/improper_authorization.dart';

import 'access_token.dart';
import 'rest_authorizer.dart';

/// The [BbRestOAuth2] class...
class BbRestOAuth2 implements BlackboardRestOAuth2 {
  final Uri host;

  final String clientId;

  final String secret;

  RestAuthorizer _restAuthorizer;

  /// The [BbRestOAuth2] constructor...
  BbRestOAuth2 (this.host, this.clientId, this.secret);

  /// The [getAuthorizationCode] abstract method...
  @override
  Future<void> getAuthorizationCode (
    Uri redirect_uri, String response_type, HttpResponse response,
    {String scope, String state}
  ) async {
    _createAuthorizer ('authorization_code');

    await (_restAuthorizer as RestUserAuthorizer).requestAuthorizationCode (
      redirect_uri.toString(), response
    );
  }

  /// The [requestToken] method...
  @override
  Future<AccessToken> requestToken (
    String grant_type, [String code, Uri redirect_uri]
  ) async {
    if (null == _restAuthorizer) {
      _createAuthorizer (grant_type);
    }

    if ('client_credentials' == grant_type) {
      return await _restAuthorizer.requestAuthorization();
    } else if ('authorization_code' == grant_type) {
      return await (_restAuthorizer as RestUserAuthorizer).requestUserAuthorization (
        code, redirect_uri?.toString()
      );
    } else {
      throw new ImproperAuthorization ('Improper grant type for authorization.');
    }
  }

  /// The [_createAuthorizer] method...
  void _createAuthorizer (String grantType) {
    if ('client_credentials' == grantType) {
      _restAuthorizer =
        AuthorizerFactory.buildAuthorizer (host, clientId, secret);
    } else if ('authorization_code' == grantType) {
      _restAuthorizer =
        AuthorizerFactory.buildAuthorizer (host, clientId, secret, 'user');
    } else {
      throw new ImproperAuthorization ('Improper grant type for authorization.');
    }
  }
}
