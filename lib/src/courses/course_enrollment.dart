library blackboard.rest.courses.enrollment;

import 'course_enrollment_type.dart';

/// The [CourseEnrollment] class...
class CourseEnrollment {
  final CourseEnrollmentType type;

  final DateTime start;

  final DateTime end;

  final String accessCode;

  /// The [CourseEnrollment] constructor...
  CourseEnrollment ({this.type, this.start, this.end, this.accessCode});
}
