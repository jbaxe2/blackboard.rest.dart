library blackboard.rest.oauth2.authorizer;

import 'dart:async' show Future;

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
  final String clientId;

  final String secret;

  /// The [_RestAuthorizer] constructor...
  _RestAuthorizer (this.clientId, this.secret);

  /// The [requestAuthorization] method...
  @override
  Future<AccessToken> requestAuthorization() async {
    AccessToken accessToken;

    return accessToken;
  }
}
