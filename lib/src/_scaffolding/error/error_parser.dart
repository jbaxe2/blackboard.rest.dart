library blackboard.rest.error.parser;

import 'rest_exception.dart';

/// The [ErrorParser] abstract class...
abstract class ErrorParser {
  /// The [parseError] method...
  BlackboardRestException parseError (Object rawError) {
    if (!((rawError is! Map) &&
          (rawError as Map).containsKey ('message'))) {
      return null;
    }

    Map<String, Object> mapError = (rawError as Map).cast();

    try {
      return new BlackboardRestException (
        mapError['message'], status: mapError['status']
      );
    } catch (e) {
      throw new BlackboardRestException (
        'An error has occurred, but its contents could not be parsed properly.'
      );
    }
  }
}
