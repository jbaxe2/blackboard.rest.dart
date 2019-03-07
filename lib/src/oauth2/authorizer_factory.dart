part of blackboard.rest.oauth2.authorizer;

/// The [AuthorizerFactory] class..
abstract class AuthorizerFactory {
  /// The [buildAuthorizer] static method...
  static RestAuthorizer buildAuthorizer (
    Uri host, String clientId, String secret, [String type]
  ) {
    RestAuthorizer restAuthorizer;

    if ('user' == type) {
      restAuthorizer = new _RestUserAuthorizer (host, clientId, secret);
    } else {
      restAuthorizer = new _RestAuthorizer (host, clientId, secret);
    }

    return restAuthorizer;
  }
}
