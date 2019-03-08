library blackboard.rest.roles.course;

import 'course_role_availability.dart';

/// The [CourseRole] class...
class CourseRole {
  final String id;

  final String roleId;

  final String nameForCourses;

  final String nameForOrganizations;

  final String description;

  final bool custom;

  final bool actAsInstructor;

  final CourseRoleAvailability availability;

  /// The [CourseRole] constructor...
  CourseRole (
    this.id, this.roleId, this.nameForCourses, this.nameForOrganizations,
    {this.description, this.custom, this.actAsInstructor, this.availability}
  );
}
