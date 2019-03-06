library blackboard.rest.memberships;

import 'dart:async' show Future;

import 'src/course_memberships/membership.dart';

/// The [CourseMemberships] abstract class...
abstract class CourseMemberships {
  /// The [getMembershipsForCourse] abstract method...
  Future<Iterable<Membership>> getMembershipsForCourse (String courseId);

  /// The [getMembershipsForUser] abstract method...
  Future<Iterable<Membership>> getMembershipsForUser (String userId);

  /// The [getMembership] abstract method...
  Future<Membership> getMembership (String courseId, String userId);

  /// The [updateMembership] abstract method...
  Future<bool> updateMembership (
    String courseId, String userId, Membership membership
  );

  /// The [createMembership] abstract method...
  Future<bool> createMembership (
    String courseId, String userId, Membership membership
  );
}
