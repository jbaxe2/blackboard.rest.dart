library blackboard.rest.error.membership;

import 'rest_exception.dart';

/// The [InvalidMembership] class...
class InvalidMembership extends BlackboardRestException {
  /// The [InvalidMembership] constructor...
  InvalidMembership (
    String message,
    {int status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
