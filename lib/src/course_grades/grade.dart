library blackboard.rest.grades.grade;

import 'grade_status.dart';

/// The [Grade] class...
class Grade {
  final String userId;

  final String columnId;

  final GradeStatus status;

  final String text;

  final double score;

  final DateTime overriden;

  final String notes;

  final String feedback;

  final bool exempt;

  final bool corrupt;

  /// The [Grade] constructor...
  Grade (
    this.userId, this.columnId, this.status, this.overriden, this.corrupt,
    {this.text, this.score, this.notes, this.feedback, this.exempt}
  );
}
