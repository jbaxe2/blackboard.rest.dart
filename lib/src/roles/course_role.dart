library blackboard.rest.roles.course;

import 'role_availability.dart';

/// The [CourseRole] class...
class CourseRole {
  final String id;

  final String roleId;

  final String nameForCourses;

  final String nameForOrganizations;

  final String description;

  final bool custom;

  final bool actAsInstructor;

  final RoleAvailability availability;

  /// The [CourseRole] constructor...
  CourseRole (
    this.id, this.roleId, this.nameForCourses, this.nameForOrganizations,
    {this.description, this.custom, this.availability, this.actAsInstructor}
  );
}
