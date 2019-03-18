library blackboard.rest.factory.course_grades.column_attempt;

import '../../../course_grades/attempt.dart';
import '../../../course_grades/attempt_status.dart';
import '../../../course_grades/display_grade.dart';
import '../../../course_grades/scale_type.dart';

import '../../error/invalid_attempt.dart';

import '../bb_rest_dto_factory.dart';

/// The [ColumnAttemptFactory] class...
class ColumnAttemptFactory implements BlackboardRestDtoFactory {
  /// The [ColumnAttemptFactory] constructor...
  ColumnAttemptFactory();

  /// The [createAll] method...
  @override
  Iterable<Attempt> createAll (
    covariant Iterable<Map<String, Object>> rawAttempts
  ) {
    var attempts = new List<Attempt>();

    rawAttempts.forEach ((rawAttempt) => attempts.add (create (rawAttempt)));

    return attempts;
  }

  /// The [create] method...
  @override
  Attempt create (covariant Map<String, Object> rawAttempt) {
    if (!(rawAttempt.containsKey ('id') &&
          rawAttempt.containsKey ('userId') &&
          rawAttempt.containsKey ('status') &&
          rawAttempt.containsKey ('displayGrade') &&
          rawAttempt.containsKey ('text') &&
          rawAttempt.containsKey ('score') &&
          rawAttempt.containsKey ('exempt') &&
          rawAttempt.containsKey ('created'))) {
      throw new InvalidAttempt (
        'Missing required information relating to the submission attempt.'
      );
    }

    return _parseColumnAttempt (rawAttempt);
  }

  /// The [_parseColumnAttempt] method...
  Attempt _parseColumnAttempt (covariant Map<String, Object> rawAttempt) {
    return new Attempt (
      rawAttempt['id'], rawAttempt['userId'],
      _parseAttemptStatus (rawAttempt['status']),
      _parseDisplayGrade (rawAttempt['displayGrade']),
      rawAttempt['text'], rawAttempt['score'], rawAttempt['exempt'],
      DateTime.parse (rawAttempt['created'])
    );
  }

  /// The [_parseAttemptStatus] method...
  AttemptStatus _parseAttemptStatus (String status) {
    AttemptStatus attemptStatus;

    switch (status.toLowerCase()) {
      case 'inprogress':
        attemptStatus = AttemptStatus.InProgress;
        break;
      case 'needsgrading':
        attemptStatus = AttemptStatus.NeedsGrading;
        break;
      case 'completed':
        attemptStatus = AttemptStatus.Completed;
        break;
      default: attemptStatus = AttemptStatus.NotAttempted;
    }

    return attemptStatus;
  }

  /// The [_parseDisplayGrade] method...
  DisplayGrade _parseDisplayGrade (covariant Map<String, Object> rawDisplayGrade) {
    return new DisplayGrade (
      ScaleType.Score, rawDisplayGrade['score'], rawDisplayGrade['text']
    );
  }
}
