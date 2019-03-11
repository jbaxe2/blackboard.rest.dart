library blackboard.rest.roles;

import 'dart:async' show Future;

import 'src/roles/course_role.dart';
import 'src/roles/institution_role.dart';
import 'src/roles/system_role.dart';

/// The [Roles] abstract class...
abstract class Roles {
  /// The [getCourseRoles] abstract method...
  Future<Iterable<CourseRole>> getCourseRoles();

  /// The [getCourseRole] abstract method...
  CourseRole getCourseRole (String roleId);

  /// The [getInstitutionRoles] abstract method...
  Future<Iterable<InstitutionRole>> getInstitutionRoles();

  /// The [getInstitutionRole] abstract method...
  InstitutionRole getInstitutionRole (String roleId);

  /// The [getSystemRoles] abstract method...
  Future<Iterable<SystemRole>> getSystemRoles();

  /// THe [getSystemRole] abstract method...
  SystemRole getSystemRole (String roleId);
}
