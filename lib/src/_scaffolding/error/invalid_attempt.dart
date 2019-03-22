library blackboard.rest.error.attempt;

import 'rest_exception.dart';

/// The [InvalidAttempt] class...
class InvalidAttempt extends BlackboardRestException {
  /// The [InvalidAttempt] constructor...
  InvalidAttempt (
    String message,
    {int status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
