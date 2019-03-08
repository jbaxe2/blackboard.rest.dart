library blackboard.rest.groups;

import 'dart:async' show Future;

import 'src/course_groups/group.dart';

/// The [CourseGroups] abstract class...
abstract class CourseGroups {
  /// The [getCourseGroups] abstract method...
  Future<Iterable<Group>> getCourseGroups (String courseId);

  /// The [createGroup] abstract method...
  Future<bool> createGroup (String courseId, Group group);

  /// The [getGroup] abstract method...
  Future<Group> getGroup (String courseId, String groupId);

  /// The [updateGroup] abstract method...
  Future<bool> updateGroup (String courseId, String groupId, Group group);
}
