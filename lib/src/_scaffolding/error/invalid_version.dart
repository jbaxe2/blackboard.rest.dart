library blackboard.rest.error.verison;

import 'rest_exception.dart';

/// The [InvalidVersion] class...
class InvalidVersion extends BlackboardRestException {
  /// The [InvalidVersion] constructor...
  InvalidVersion (
    String message,
    {String status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
