library blackboard.rest.grades.grade;

import 'display_grade.dart';
import 'grade_status.dart';

/// The [Grade] class...
class Grade {
  final String userId;

  final String columnId;

  final GradeStatus status;

  final DisplayGrade displayGrade;

  final String text;

  final double score;

  final DateTime overriden;

  final String notes;

  final String feedback;

  final bool exempt;

  final bool corrupt;

  final String gradeNotationId;

  final int changeIndex;

  /// The [Grade] constructor...
  Grade (
    this.userId, this.columnId, this.status, this.displayGrade, this.overriden,
    this.corrupt, this.changeIndex,
    {this.text, this.score, this.notes, this.feedback, this.exempt,
     this.gradeNotationId}
  );
}
