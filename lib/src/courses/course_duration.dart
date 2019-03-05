library blackboard.rest.courses.duration;

import 'course_duration_type.dart';

/// The [CourseDuration] class...
class CourseDuration {
  final CourseDurationType type;

  final DateTime start;

  final DateTime end;

  final int daysOfUse;

  /// The [CourseDuration] constructor...
  CourseDuration (
    {this.type, this.start, this.end, this.daysOfUse}
  );
}
