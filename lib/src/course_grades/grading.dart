library blackboard.rest.grades.grading;

import 'anonymous_grading.dart';
import 'grading_type.dart';
import 'scoring_model.dart';

/// The [Grading] class...
class Grading {
  final GradingType type;

  final DateTime due;

  final int attemptsAllowed;

  final ScoringModel scoringModel;

  final String schemaId;

  final AnonymousGrading anonymousGrading;

  /// The [Grading] constructor...
  Grading (
    this.type, this.schemaId,
    {this.due, this.attemptsAllowed, this.scoringModel, this.anonymousGrading}
  );
}
