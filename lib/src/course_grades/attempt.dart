library blackboard.rest.grades.attempt;

import 'attempt_status.dart';
import 'display_grade.dart';

/// The [Attempt] class...
class Attempt {
  final String id;

  final String userId;

  final String groupAttemptId;

  final bool groupOverride;

  final AttemptStatus status;

  final DisplayGrade displayGrade;

  final String text;

  final double score;

  final String notes;

  final String feedback;

  final String studentComments;

  final String studentSubmission;

  final bool exempt;

  final DateTime created;

  /// The [Attempt] constructor...
  Attempt (
    this.id, this.userId, this.groupAttemptId, this.groupOverride,
    this.displayGrade, this.created,
    {this.status, this.text, this.score, this.notes, this.feedback,
     this.studentComments, this.studentSubmission, this.exempt}
  );
}
