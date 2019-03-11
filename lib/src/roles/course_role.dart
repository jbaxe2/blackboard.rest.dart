library blackboard.rest.roles.course;

import 'course_role_availability.dart';
import 'role.dart';

/// The [CourseRole] class...
class CourseRole extends Role {
  final String nameForCourses;

  final String nameForOrganizations;

  final bool actAsInstructor;

  final CourseRoleAvailability availability;

  /// The [CourseRole] constructor...
  CourseRole (
    String id, String roleId, String description, bool custom,
    this.nameForCourses, this.nameForOrganizations,
    {this.actAsInstructor, this.availability}
  ) : super (id, roleId, nameForCourses, custom, description: description);
}
