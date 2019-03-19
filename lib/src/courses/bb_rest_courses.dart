library blackboard.rest.implementation.courses;

import 'dart:async' show Future;

import '../../courses.dart';

import '../_scaffolding/configuration/endpoints.dart' show courses;
import '../_scaffolding/error/invalid_course.dart';
import '../_scaffolding/factory/course_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import 'course.dart';
import 'course_child.dart';
import 'course_task.dart';

/// The [BbRestCourses] class...
class BbRestCourses extends BlackboardRestServices implements Courses {
  /// The [BbRestCourses] constructor...
  BbRestCourses (String host, AccessToken token) : super (host, token);

  /// The [getCourses] abstract method...
  @override
  Future<Iterable<Course>> getCourses() async {}

  /// The [createCourse] abstract method...
  @override
  Future<void> createCourse (Course course) async {}

  /// The [getCourse] abstract method...
  @override
  Future<Course> getCourse (String courseId) async {
    String endpoint = courses['get_course'].replaceFirst ('{courseId}', courseId);
    Object rawResult;

    try {
      rawResult = await connector.sendBbRestRequest (endpoint);
    } catch (e) {
      throw e as InvalidCourse;
    }

    return (new CourseFactory()).create ((rawResult as Map).cast());
  }

  /// The [updateCourse] abstract method...
  @override
  Future<void> updateCourse (String courseId, Course course) async {}

  /// The [getChildrenCourses] abstract method...
  @override
  Future<Iterable<CourseChild>> getChildrenCourses (String courseId) async {}

  /// The [getChildCourse] abstract method...
  @override
  Future<CourseChild> getChildCourse (String courseId, String childCourseId) async {}

  /// The [addChildCourse] abstract method...
  @override
  Future<void> addChildCourse (
    String courseId, String childCourseId, [bool ignoreEnrollmentErrors]
  ) async {}

  /// The [copyCourse] abstract method...
  @override
  Future<void> copyCourse (String courseId, String newCourseId) async {}

  /// The [getCrossListSet] abstract method...
  @override
  Future<Iterable<CourseChild>> getCrossListSet (String courseId) async {}

  /// The [getTask] abstract method...
  @override
  Future<CourseTask> getTask (String courseId, String taskId) async {}
}
