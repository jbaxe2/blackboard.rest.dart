library blackboard.rest.grades.display_grade;

import 'scale_type.dart';

/// The [DisplayGrade] class...
class DisplayGrade {
  final ScaleType scaleType;

  final double score;

  final String text;

  /// The [DisplayGrade] constructor...
  DisplayGrade (this.scaleType, this.score, this.text);
}
