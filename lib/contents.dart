library blackboard.rest.contents;

import 'dart:async' show Future;

import 'src/contents/assignment.dart';
import 'src/contents/content.dart';

/// The [Contents] abstract class...
abstract class Contents {
  /// The [getContents] abstract method...
  Future<Iterable<Content>> getContents (String courseId);

  /// The [createContent] abstract method...
  Future<bool> createContent (String courseId, Content content);

  /// The [createAssignment] abstract method...
  Future<bool> createAssignment (String courseId, Assignment assignment);

  /// The [getContent] abstract method...
  Future<Content> getContent (String courseId, String contentId);

  /// The [updateContent] abstract method...
  Future<bool> updateContent (String courseId, String contentId, Content content);

  /// The [getChildren] abstract method...
  Future<Iterable<Content>> getChildren (String courseId, String contentId);

  /// The [createChild] abstract method...
  Future<bool> createChild (String courseId, String contentId, Content content);
}
