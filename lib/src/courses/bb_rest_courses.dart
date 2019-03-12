library blackboard.rest.implementation.courses;

import 'dart:async' show Future;

import '../../courses.dart';

import '../_scaffolding/configuration/endpoints.dart' show courses;
import '../_scaffolding/connector/connector.dart';
import '../_scaffolding/factory/course_factory.dart';

import '../oauth2/access_token.dart';

import 'course.dart';
import 'course_child.dart';
import 'course_task.dart';

/// The [BbRestCourses] class...
class BbRestCourses implements Courses {
  BlackboardRestConnector _connector;

  /// The [BbRestCourses] constructor...
  BbRestCourses (String host, AccessToken token) {
    _connector = RestConnectorFactory.buildRestConnector (host, token);
  }

  /// The [getCourses] abstract method...
  Future<Iterable<Course>> getCourses() async {}

  /// The [createCourse] abstract method...
  Future<void> createCourse (Course course) async {}

  /// The [getCourse] abstract method...
  Future<Course> getCourse (String courseId) async {
    String endpoint = courses['get_course'].replaceFirst ('{courseId}', courseId);
    Object rawResult = await _connector.sendBbRestRequest (endpoint);

    return (new CourseFactory()).create ((rawResult as Map).cast());
  }

  /// The [updateCourse] abstract method...
  Future<void> updateCourse (String courseId, Course course) async {}

  /// The [getChildrenCourses] abstract method...
  Future<Iterable<CourseChild>> getChildrenCourses (String courseId) async {}

  /// The [getChildCourse] abstract method...
  Future<CourseChild> getChildCourse (String courseId, String childCourseId) async {}

  /// The [addChildCourse] abstract method...
  Future<void> addChildCourse (
    String courseId, String childCourseId, [bool ignoreEnrollmentErrors]
  ) async {}

  /// The [copyCourse] abstract method...
  Future<void> copyCourse (String courseId, String newCourseId) async {}

  /// The [getCrossListSet] abstract method...
  Future<Iterable<CourseChild>> getCrossListSet (String courseId) async {}

  /// The [getTask] abstract method...
  Future<CourseTask> getTask (String courseId, String taskId) async {}
}
