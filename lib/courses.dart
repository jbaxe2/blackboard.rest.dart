library blackboard.rest.courses;

import 'dart:async' show Future;

import 'src/courses/course.dart';
import 'src/courses/course_child.dart';
import 'src/courses/course_task.dart';

/// The [Courses] abstract class...
abstract class Courses {
  /// The [getCourses] abstract method...
  Future<Iterable<Course>> getCourses();

  /// The [createCourse] abstract method...
  Future<void> createCourse (Course course);

  /// The [getCourse] abstract method...
  Future<Course> getCourse (String courseId);

  /// The [updateCourse] abstract method...
  Future<void> updateCourse (String courseId, Course course);

  /// The [getChildrenCourses] abstract method...
  Future<Iterable<CourseChild>> getChildrenCourses (String courseId);

  /// The [getChildCourse] abstract method...
  Future<CourseChild> getChildCourse (String courseId, String childCourseId);

  /// The [addChildCourse] abstract method...
  Future<void> addChildCourse (
    String courseId, String childCourseId, [bool ignoreEnrollmentErrors]
  );

  /// The [copyCourse] abstract method...
  Future<void> copyCourse (String courseId, String newCourseId);

  /// The [getCrossListSet] abstract method...
  Future<Iterable<CourseChild>> getCrossListSet (String courseId);

  /// The [getTask] abstract method...
  Future<CourseTask> getTask (String courseId, String taskId);
}
