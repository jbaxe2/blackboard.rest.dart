library blackboard.rest.factory.course_membership;

import '../../course_memberships/membership.dart';
import '../../course_memberships/membership_availability.dart';
import '../../course_memberships/membership_role.dart';

import '../error/invalid_membership.dart';

import 'bb_rest_dto_factory.dart';

/// The [CourseMembershipFactory] class...
class CourseMembershipFactory implements BlackboardRestDtoFactory {
  /// The [CourseMembershipFactory] constructor...
  CourseMembershipFactory();

  /// The [createAll] method...
  @override
  Iterable<Membership> createAll (
    covariant Iterable<Map<String, Object>> rawMemberships
  ) {
    var memberships = new List<Membership>();

    rawMemberships.forEach (
      (rawMembership) => memberships.add (create (rawMembership))
    );

    return memberships;
  }

  /// The [create] method...
  @override
  Membership create (covariant Map<String, Object> rawMembership) {
    if (!(rawMembership.containsKey ('userId') &&
          rawMembership.containsKey ('courseId') &&
          rawMembership.containsKey ('created') &&
          rawMembership.containsKey ('availability') &&
          rawMembership.containsKey ('courseRoleId') &&
          rawMembership.containsKey ('lastAccessed'))) {
      throw new InvalidMembership (
        'Missing required information for the course membership.'
      );
    }

    return _parseMembership (rawMembership);
  }

  /// The [_parseMembership] method...
  Membership _parseMembership (covariant Map<String, Object> rawMembership) {
    return new Membership (
      rawMembership['userId'], rawMembership['courseId'],
      DateTime.parse (rawMembership['created']),
      _parseMembershipAvailability ((rawMembership['availability'] as Map).cast()),
      _parseMembershipRole (rawMembership['courseRoleId']),
      DateTime.parse (rawMembership['lastAccessed'])
    );
  }

  /// The [_parseMembershipAvailability] method...
  MembershipAvailability _parseMembershipAvailability (
    Map<String, String> availability
  ) {
    switch (availability['available'].toLowerCase()) {
      case 'yes': return MembershipAvailability.Yes; break;
      case 'disabled': return MembershipAvailability.Disabled; break;
      default: return MembershipAvailability.No;
    }
  }

  /// The [_parseMembershipRole] method...
  MembershipRole _parseMembershipRole (String role) {
    switch (role.toLowerCase()) {
      case 'instructor': return MembershipRole.Instructor;
      default: return MembershipRole.Student;
    }
  }
}
