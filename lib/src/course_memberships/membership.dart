library blackboard.rest.memberships.membership;

import 'membership_availability.dart';
import 'membership_role.dart';

/// The [Membership] class...
class Membership {
  final String userId;

  final String courseId;

  final String childCourseId;

  final String dataSourceId;

  final DateTime created;

  final MembershipAvailability availability;

  final MembershipRole courseRoleId;

  final DateTime bypassCourseAvailabilityUntil;

  final DateTime lastAccessed;

  /// The [Membership] constructor...
  Membership (
    this.userId, this.courseId, this.created, this.availability,
    this.courseRoleId, this.lastAccessed,
    {this.childCourseId, this.dataSourceId, this.bypassCourseAvailabilityUntil}
  );
}
