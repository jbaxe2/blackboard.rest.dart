library blackboard.rest.error.parser;

import 'rest_exception.dart';

/// The [ErrorParser] abstract class...
abstract class ErrorParser {
  /// The [parsePotentialError] method...
  BlackboardRestException parsePotentialError (covariant Object rawError) {
    Map errorMap;

    try {
      errorMap = rawError as Map;
    } catch (_) {
      return null;
    }

    if (!(errorMap.containsKey ('message') && errorMap.containsKey ('status'))) {
      return null;
    }

    try {
      return new BlackboardRestException (
        errorMap['message'], status: errorMap['status']
      );
    } catch (e) {
      throw new BlackboardRestException (
        'An error has occurred, but its contents could not be parsed properly.'
      );
    }
  }
}
