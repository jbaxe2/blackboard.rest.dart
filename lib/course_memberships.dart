library blackboard.rest.memberships;

import 'dart:async' show Future;

import 'src/course_memberships/membership.dart';

/// The [CourseMemberships] abstract class...
abstract class CourseMemberships {
  /// The [getMembershipsForCourse] abstract method...
  Future<Iterable<Membership>> getMembershipsForCourse (String courseId);
}
