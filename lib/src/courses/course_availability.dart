library blackboard.rest.courses.availability;

import 'course_duration.dart';

/// The [CourseAvailability] class...
class CourseAvailability {
  final String availability;

  final CourseDuration duration;

  /// The [CourseAvailability] constructor...
  CourseAvailability ({this.availability, this.duration});
}
