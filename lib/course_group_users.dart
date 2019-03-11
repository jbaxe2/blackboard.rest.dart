library blackboard.rest.groups.users;

import 'src/course_groups/users/group_membership.dart';

/// The [CourseGroupUsers] abstract class...
abstract class CourseGroupUsers {
  /// The [getGroupMemberships] abstract method...
  Future<Iterable<GroupMembership>> getGroupMemberships (
    String courseId, String groupId
  );

  /// The [getGroupMembership] abstract method...
  Future<GroupMembership> getGroupMembership (
    String courseId, String groupId, String userId
  );

  /// The [createGroupMembership] abstract method...
  Future<void> createGroupMembership (
    String courseId, String groupId, String userId
  );
}
