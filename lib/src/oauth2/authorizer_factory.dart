part of blackboard.rest.oauth2.authorizer;

/// The [AuthorizerFactory] class..
abstract class AuthorizerFactory {
  /// The [buildAuthorizer] static method...
  static RestAuthorizer buildAuthorizer (
    String clientId, String secret, [String type]
  ) {
    RestAuthorizer restAuthorizer;

    if ('user' == type) {
      restAuthorizer = new _RestUserAuthorizer (clientId, secret);
    } else {
      restAuthorizer = new _RestAuthorizer (clientId, secret);
    }

    return restAuthorizer;
  }
}
