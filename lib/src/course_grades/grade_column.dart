library blackboard.rest.grades.column;

import 'grade_availability.dart';
import 'grading.dart';
import 'score.dart';

/// The [GradeColumn] class...
class GradeColumn {
  final String id;

  final String externalId;

  final String name;

  final String displayName;

  final String description;

  final bool externalGrade;

  final DateTime created;

  final String contentId;

  final Score score;

  final GradeAvailability availability;

  final Grading grading;

  /// The [GradeColumn] constructor...
  GradeColumn (
    this.id, this.name, this.score, this.availability, this.grading,
    {this.externalId, this.displayName, this.description, this.externalGrade,
     this.created, this.contentId}
  );
}
