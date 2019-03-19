@TestOn('vm')
library blackboard.rest.tests.course_memberships;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/course_memberships/bb_rest_course_memberships.dart';
import 'package:blackboard.rest/src/course_memberships/membership.dart';

import 'package:blackboard.rest/course_memberships.dart';

import '../test_authorizer.dart';
import '../testable.dart';

/// The [CourseMembershipsTester] class...
class CourseMembershipsTester extends TestAuthorizer implements Testable {
  /// The [CourseMembershipsTester] constructor...
  CourseMembershipsTester();

  /// The [run] method...
  @override
  void run() {
    group ('Course Memberships:', () {
      _testGetValidCourseMembershipsInstance();
      _testGetCourseMembershipsByCoursePrimaryId();
      _testGetCourseMembershipsByCourseExternalId();
      _testGetCourseMembershipsByCourseGuiId();
      _testGetCourseMembershipsByUserPrimaryId();
      _testGetCourseMembershipsByUserExternalId();
      _testGetCourseMembershipsByUserName();
      _testGetCourseMembershipByCourseUserPrimaryIds();
    });
  }

  /// The [_testGetValidCourseMembershipsInstance] method...
  void _testGetValidCourseMembershipsInstance() {
    test ('Get a valid course memberships service instance.', () async {
      CourseMemberships membershipsService =
        getCourseMembershipsInstance (host, await authorizeForTests());

      assert (null != membershipsService);
      expect ((membershipsService is BbRestCourseMemberships), true);
    });
  }

  /// The [_testGetCourseMembershipsByCoursePrimaryId] method...
  void _testGetCourseMembershipsByCoursePrimaryId() {
    test ('Get a list of course memberships by the course\'s primary ID.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships = await bbRestMemberships.getMembershipsForCourse ('_121_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipsByCourseExternalId] method...
  void _testGetCourseMembershipsByCourseExternalId() {
    test ('Get a list of course memberships by the course\'s external ID.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships = await bbRestMemberships.getMembershipsForCourse (
          'externalId:wsu_jaxenroth_sandbox_1'
        );
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipsByCourseGuiId] method...
  void _testGetCourseMembershipsByCourseGuiId() {
    test ('Get a list of course memberships by the course\'s course ID.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships = await bbRestMemberships.getMembershipsForCourse (
          'courseId:wsu_jaxenroth_sandbox_1'
        );
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipsByUserPrimaryId] method...
  void _testGetCourseMembershipsByUserPrimaryId() {
    test ('Get a list of course memberships by the user\'s primary ID.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships = await bbRestMemberships.getMembershipsForUser ('_27_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipsByUserExternalId] method...
  void _testGetCourseMembershipsByUserExternalId() {
    test ('Get a list of course memberships by the user\'s external ID.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships =
          await bbRestMemberships.getMembershipsForUser ('externalId:jaxenroth');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipsByUserName] method...
  void _testGetCourseMembershipsByUserName() {
    test ('Get a list of course memberships by the user\'s username.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      List<Membership> memberships;

      try {
        memberships =
          await bbRestMemberships.getMembershipsForUser ('userName:jaxenroth');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != memberships);

      expect (memberships.isNotEmpty, true);
    });
  }

  /// The [_testGetCourseMembershipByCourseUserPrimaryIds] method...
  void _testGetCourseMembershipByCourseUserPrimaryIds() {
    test ('Get a course membership by the primary ID of both course and user.', () async {
      CourseMemberships bbRestMemberships =
        getCourseMembershipsInstance (host, await authorizeForTests());

      Exception error;
      Membership membership;

      try {
        membership = await bbRestMemberships.getMembership ('_121_1', '_27_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != membership);

      bool properMembership =
        ('_121_1' == membership.courseId) && ('_27_1' == membership.userId);

      expect (properMembership, true);
    });
  }
}
