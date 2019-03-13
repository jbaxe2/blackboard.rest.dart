library blackboard.rest.courses.course;

import 'course_availability.dart';
import 'course_enrollment.dart';
import 'locale.dart';
import 'ultra_status.dart';

/// The [Course] class...
class Course {
  final String id;

  final String uuid;

  final String externalId;

  final String dataSourceId;

  final String courseId;

  final String name;

  final String description;

  final DateTime created;

  final bool organization;

  final UltraStatus ultraStatus;

  final bool allowGuests;

  final bool readOnly;

  final String termId;

  final CourseAvailability availability;

  final CourseEnrollment enrollment;

  final Locale locale;

  final bool hasChildren;

  final String parentId;

  final String externalAccessUrl;

  final String guestAccessUrl;

  /// The [Course] constructor...
  Course (
    this.id, this.uuid, this.courseId, this.externalId, this.name, this.created,
    this.organization, this.externalAccessUrl, this.guestAccessUrl,
    {this.dataSourceId, this.description, this.ultraStatus,
     this.allowGuests, this.readOnly, this.termId, this.availability,
     this.enrollment, this.locale, this.hasChildren, this.parentId}
  );
}
