library blackboard.rest.error.authorization;

import 'rest_exception.dart';

/// The [ImproperAuthorization] class...
class ImproperAuthorization extends BlackboardRestException {
  /// The [ImproperAuthorization] constructor...
  ImproperAuthorization (
    String message,
    {int status, String code, String developerMessage, String extraInfo}
  ) : super (
    message, status: status, code: code,
    developerMessage: developerMessage, extraInfo: extraInfo
  );
}
