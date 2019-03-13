@TestOn('vm')
library blackboard.rest.tests.courses;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/courses/bb_rest_courses.dart';
import 'package:blackboard.rest/src/courses/course.dart';

import '../test_authorizer.dart';
import '../testable.dart';

/// The [CoursesTester] class...
class CoursesTester extends TestAuthorizer implements Testable {
  /// The [CoursesTester] constructor...
  CoursesTester();

  /// The [run] method...
  @override
  void run() {
    group ('Courses:', () {
      _testGetCourseByPrimaryId();
      _testGetCourseByCourseId();
      _testGetCourseByExternalId();
    });
  }

  /// The [_testGetCourseByPrimaryId] method...
  void _testGetCourseByPrimaryId() {
    test ('Get a course by its primary (internal) ID.', () async {
      var bbRestCourses = new BbRestCourses (host, await authorizeForTests());

      Exception error;
      Course course;

      try {
        course = await bbRestCourses.getCourse ('_121_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != course);

      expect (('_121_1' == course.id), true);
    });
  }

  /// The [_testGetCourseByCourseId] method...
  void _testGetCourseByCourseId() {
    test ('Get a course by its course ID (as displayed in GUI).', () async {
      var bbRestCourses = new BbRestCourses (host, await authorizeForTests());

      Exception error;
      Course course;

      try {
        course = await bbRestCourses.getCourse ('courseId:wsu_jaxenroth_sandbox_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != course);

      expect (('wsu_jaxenroth_sandbox_1' == course.courseId), true);
    });
  }

  /// The [_testGetCourseByExternalId] method...
  void _testGetCourseByExternalId() {
    test ('Get a course by its external ID.', () async {
      var bbRestCourses = new BbRestCourses (host, await authorizeForTests());

      Exception error;
      Course course;

      try {
        course = await bbRestCourses.getCourse ('externalId:wsu_jaxenroth_sandbox_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != course);

      expect (('wsu_jaxenroth_sandbox_1' == course.externalId), true);
    });
  }
}
