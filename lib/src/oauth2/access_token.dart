library blackboard.rest.oauth2.access_token;

/// The [AccessToken] class...
class AccessToken {
  final String access_token;

  final String token_type;

  final int expires_in;

  final String refresh_token;

  final String scope;

  final String user_id;

  /// The [AccessToken] constructor...
  AccessToken (
    this.access_token, this.token_type, this.expires_in,
    this.refresh_token, this.scope, this.user_id
  );
}
