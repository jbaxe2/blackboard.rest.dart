library blackboard.rest.error.term;

import 'rest_exception.dart';

/// The [InvalidTerm] class...
class InvalidTerm extends BlackboardRestException {
  /// The [InvalidTerm] constructor...
  InvalidTerm (
    String message,
    {int status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
