library blackboard.rest.memberships;

import 'dart:async' show Future;

import 'src/course_memberships/bb_rest_course_memberships.dart';
import 'src/course_memberships/membership.dart';

import 'src/oauth2/access_token.dart';

export 'src/course_memberships/membership.dart';
export 'src/course_memberships/membership_availability.dart';
export 'src/course_memberships/membership_role.dart';

/// The [getCourseMembershipsInstance] function...
CourseMemberships getCourseMembershipsInstance (String host, AccessToken token) =>
  new BbRestCourseMemberships (host, token);

/// The [CourseMemberships] abstract class...
abstract class CourseMemberships {
  /// The [getMembershipsForCourse] abstract method...
  Future<Iterable<Membership>> getMembershipsForCourse (String courseId);

  /// The [getMembershipsForUser] abstract method...
  Future<Iterable<Membership>> getMembershipsForUser (String userId);

  /// The [getMembership] abstract method...
  Future<Membership> getMembership (String courseId, String userId);

  /// The [updateMembership] abstract method...
  Future<void> updateMembership (
    String courseId, String userId, Membership membership
  );

  /// The [createMembership] abstract method...
  Future<void> createMembership (
    String courseId, String userId, Membership membership
  );
}
