library blackboard.rest.exception.authorization;

import 'rest_exception.dart';

/// The [AuthorizationException] class...
class AuthorizationException extends BlackboardRestException {
  /// The [AuthorizationException] constructor...
  AuthorizationException (
    String message,
    {String status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
