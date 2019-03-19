library blackboard.rest.implementation.course_memberships;

import 'dart:async' show Future;

import '../../course_memberships.dart';

import '../_scaffolding/configuration/endpoints.dart' show course_memberships;
import '../_scaffolding/error/invalid_membership.dart';
import '../_scaffolding/factory/course_membership_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import 'membership.dart';

/// The [BbRestCourseMemberships] class...
class BbRestCourseMemberships
    extends BlackboardRestServices implements CourseMemberships {
  /// The [BbRestCourseMemberships] constructor...
  BbRestCourseMemberships (String host, AccessToken token) : super (host, token);

  /// The [getMembershipsForCourse] method...
  @override
  Future<Iterable<Membership>> getMembershipsForCourse (String courseId) async {
    String endpoint = course_memberships['get_course_memberships']
      .replaceFirst ('{courseId}', courseId);

    Iterable<Object> rawMemberships;

    try {
      rawMemberships = (await connector.sendBbRestRequest (endpoint) as Map)['results'];
    } catch (e) {
      throw e as InvalidMembership;
    }

    return (new CourseMembershipFactory()).createAll (rawMemberships.cast());
  }

  /// The [getMembershipsForUser] method...
  @override
  Future<Iterable<Membership>> getMembershipsForUser (String userId) async {
    String endpoint = course_memberships['get_user_memberships']
      .replaceFirst ('{userId}', userId);

    Iterable<Object> rawMemberships;

    try {
      rawMemberships = (await connector.sendBbRestRequest (endpoint) as Map)['results'];
    } catch (e) {
      throw e as InvalidMembership;
    }

    return (new CourseMembershipFactory()).createAll (rawMemberships.cast());
  }

  /// The [getMembership] method...
  @override
  Future<Membership> getMembership (String courseId, String userId) async {
    String endpoint = course_memberships['get_membership']
      .replaceFirst ('{courseId}', courseId)
      .replaceFirst ('{userId}', userId);

    Object rawMembership;

    try {
      rawMembership = await connector.sendBbRestRequest (endpoint);
    } catch (e) {
      throw e as InvalidMembership;
    }

    return (new CourseMembershipFactory()).create (rawMembership);
  }

  /// The [updateMembership] method...
  @override
  Future<void> updateMembership (
    String courseId, String userId, Membership membership
  ) async {}

  /// The [createMembership] method...
  @override
  Future<void> createMembership (
    String courseId, String userId, Membership membership
  ) async {}
}
