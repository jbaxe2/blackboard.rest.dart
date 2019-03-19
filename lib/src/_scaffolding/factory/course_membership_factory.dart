library blackboard.rest.factory.course_membership;

import '../../course_memberships/membership.dart';

/// The [CourseMembershipFactory] class...
class CourseMembershipFactory {
  /// The [CourseMembershipFactory] constructor...
  CourseMembershipFactory();

  /// The [createAll] method...
  @override
  Iterable<Membership> createAll (
    covariant Iterable<Map<String, Object>> rawMemberships
  ) {
    ;
  }

  /// The [create] method...
  @override
  Membership create (covariant Map<String, Object> rawMembership) {
    ;
  }

  Membership _parseMembership (covariant Map<String, Object> rawMembership) {
    ;
  }
}
