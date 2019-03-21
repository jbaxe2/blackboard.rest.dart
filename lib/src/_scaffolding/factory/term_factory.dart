library blackboard.rest.factory.term;

import '../../terms/term.dart';
import '../../terms/term_availability.dart';
import '../../terms/term_duration.dart';

import '../error/invalid_term.dart';

import 'bb_rest_dto_factory.dart';

/// The [TermFactory] class...
class TermFactory implements BlackboardRestDtoFactory {
  /// The [TermFactory] constructor...
  TermFactory();

  /// The [createAll] method...
  @override
  Iterable<Term> createAll (covariant Iterable<Map<String, Object>> rawTerms) {
    var terms = new List<Term>();

    rawTerms.forEach ((rawTerm) => terms.add (create (rawTerm)));

    return terms;
  }

  /// The [create] method...
  @override
  Term create (covariant Map<String, Object> rawTerm) {
    if (!(rawTerm.containsKey ('id') &&
          rawTerm.containsKey ('externalId') &&
          rawTerm.containsKey ('name'))) {
      throw new InvalidTerm ('Missing required information to create the term.');
    }

    return _parseTerm (rawTerm);
  }

  /// The [_parseTerm] method...
  Term _parseTerm (covariant Map<String, Object> rawTerm) {
    if (rawTerm.containsKey ('description')) {
      return new Term (
        rawTerm['id'], rawTerm['externalId'], rawTerm['name'],
        availability: _parseAvailability (rawTerm['availability']),
        description: rawTerm['description']
      );
    }

    return new Term (
      rawTerm['id'], rawTerm['externalId'], rawTerm['name'],
      availability: _parseAvailability (rawTerm['availability'])
    );
  }

  /// The [_parseAvailability] method...
  TermAvailability _parseAvailability (covariant Map<String, Object> rawAvailability) {
    Availability availability = Availability.No;

    if ('yes' == (rawAvailability['available'] as String).toLowerCase()) {
      availability = Availability.Yes;
    }

    return new TermAvailability (
      available: availability, duration: _parseDuration (rawAvailability['duration'])
    );
  }

  /// The [_parseDuration] method...
  TermDuration _parseDuration (covariant Map<String, Object> duration) {
    DurationType type;

    switch ((duration['type'] as String).toLowerCase()) {
      case 'daterange':
        type = DurationType.DateRange;
        break;
      case 'fixednumdays':
        type = DurationType.FixedNumDays;
        break;
      default: type = DurationType.Continuous;
    }

    if (DurationType.Continuous == type) {
      return new TermDuration (type: type);
    }

    return new TermDuration (
      type: type,
      start: DateTime.parse (duration['start']),
      end: DateTime.parse (duration['end'])
    );
  }
}
