library blackboard.rest.error.grade;

import 'rest_exception.dart';

/// The [InvalidGrade] class...
class InvalidGrade extends BlackboardRestException {
  /// The [InvalidGrade] constructor...
  InvalidGrade (
    String message,
    {String status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
