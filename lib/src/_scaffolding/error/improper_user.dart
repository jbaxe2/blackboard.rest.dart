library blackboard.rest.error.user;

import 'rest_exception.dart';

/// The [ImproperUser] class...
class ImproperUser extends BlackboardRestException {
  /// The [ImproperUser] constructor...
  ImproperUser (
    String message,
    {int status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
