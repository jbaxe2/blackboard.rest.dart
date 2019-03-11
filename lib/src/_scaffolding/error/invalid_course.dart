library blackboard.rest.error.course;

import 'rest_exception.dart';

/// The [InvalidCourse] class...
class InvalidCourse extends BlackboardRestException {
  /// The [InvalidCourse] constructor...
  InvalidCourse (
    String message,
    {String status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
