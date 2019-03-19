@TestOn('vm')
library blackboard.rest.tests.course_grades;

import 'package:test/test.dart';

import 'package:blackboard.rest/course_grades.dart';

import 'package:blackboard.rest/src/course_grades/bb_rest_course_grades.dart';

import '../test_authorizer.dart';
import '../testable.dart';

/// The [CourseGradesTester] class...
class CourseGradesTester extends TestAuthorizer implements Testable {
  /// The [CourseGradesTester] constructor...
  CourseGradesTester();

  /// The [run] method...
  @override
  void run() {
    group ('Course Grades:', () {
      _testGetValidCourseGradesInstance();
      _testGetGradeColumnsForCourseByInternalId();
      _testGetGradeColumnForCourseByInternalIds();
      _testGetGradeColumnMatchesFromGetGradeColumns();
      _testGetColumnAttemptsByColumnInternalId();
      _testGetColumnAttemptByColumnAndAttemptInternalIds();
      _testGetAttemptMatchesFromRetrievedColumnAttempts();
    });
  }

  /// The [_testGetValidCourseGradesInstance] method...
  void _testGetValidCourseGradesInstance() {
    test ('Get a valid course grades service instance.', () async {
      CourseGrades courseGradesService = getCourseGradesInstance (
        host, await authorizeForTests()
      );

      assert (null != courseGradesService);
      expect ((courseGradesService is BbRestCourseGrades), true);
    });
  }

  /// The [_testGetGradeColumnsForCourseByInternalId] method...
  void _testGetGradeColumnsForCourseByInternalId() {
    test ('Get grade columns for a course by its internal ID.', () async {
      CourseGrades courseGrades = getCourseGradesInstance (
        host, await authorizeForTests()
      );

      Exception error;
      List<GradeColumn> columns;

      try {
        columns = await courseGrades.getGradeColumns ('_121_1');
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != columns);

      expect (columns.isEmpty, false);
    });
  }

  /// The [_testGetGradeColumnForCourseByInternalIds] method...
  void _testGetGradeColumnForCourseByInternalIds() {
    test ('Get a grade column for a course by their internal ID\'s.', () async {
      CourseGrades courseGrades = getCourseGradesInstance (
        host, await authorizeForTests()
      );

      Exception error;
      GradeColumn column;

      try {
        List<GradeColumn> columns = await courseGrades.getGradeColumns ('_121_1');
        column = await courseGrades.getGradeColumn ('_121_1', columns.first.id);
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != column);

      expect (null != column.id, true);
    });
  }

  /// The [_testGetGradeColumnMatchesFromGetGradeColumns] method...
  void _testGetGradeColumnMatchesFromGetGradeColumns() {
    test (
      'Get a grade column matches what is returned by retrieving grade columns.',
      () async {
        CourseGrades courseGrades = getCourseGradesInstance (
          host, await authorizeForTests()
        );

        Exception error;
        GradeColumn column1, column2;

        try {
          List<GradeColumn> columns = await courseGrades.getGradeColumns ('_121_1');
          column1 = columns.first;

          column2 = await courseGrades.getGradeColumn ('_121_1', columns.first.id);
        } catch (e) {
          error = e;
        }

        assert (null == error);
        assert (null != column1);
        assert (null != column2);

        expect ((column1.id == column2.id), true);
      }
    );
  }

  /// The [_testGetColumnAttemptsByColumnInternalId] method...
  void _testGetColumnAttemptsByColumnInternalId() {
    test ('Get the column attempts by a column\'s internal ID.', () async {
      CourseGrades courseGrades = getCourseGradesInstance (
        host, await authorizeForTests()
      );

      Exception error;
      List<Attempt> attempts;

      try {
        List<GradeColumn> columns = await courseGrades.getGradeColumns ('_121_1');

        attempts = await courseGrades.getColumnAttempts ('_121_1', columns[1].id);
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != attempts);

      expect (attempts.isEmpty, false);
    });
  }

  /// The [_testGetColumnAttemptByColumnAndAttemptInternalIds] method...
  void _testGetColumnAttemptByColumnAndAttemptInternalIds() {
    test (
      'Get the column attempt by the column and attempt internal ID\'s.', () async {
        CourseGrades courseGrades = getCourseGradesInstance (
          host, await authorizeForTests()
        );

        Exception error;
        Attempt attempt;

        try {
          List<GradeColumn> columns = await courseGrades.getGradeColumns ('_121_1');

          List<Attempt> attempts =
            await courseGrades.getColumnAttempts ('_121_1', columns[1].id);

          attempt = await courseGrades.getColumnAttempt (
            '_121_1', columns[1].id, attempts[0].id
          );
        } catch (e) {
          error = e;
        }

        assert (null == error);
        expect ((null == attempt), false);
      }
    );
  }

  /// The [_testGetAttemptMatchesFromRetrievedColumnAttempts] method...
  void _testGetAttemptMatchesFromRetrievedColumnAttempts() {
    test (
      'Get a column attempt matches what is returned by retrieving column attempts.',
      () async {
        CourseGrades courseGrades = getCourseGradesInstance (
          host, await authorizeForTests()
        );

        Exception error;
        List<Attempt> attempts;
        Attempt attempt;

        try {
          List<GradeColumn> columns = await courseGrades.getGradeColumns ('_121_1');

          attempts = await courseGrades.getColumnAttempts ('_121_1', columns[1].id);

          attempt = await courseGrades.getColumnAttempt (
            '_121_1', columns[1].id, attempts[0].id
          );
        } catch (e) {
          error = e;
        }

        assert (null == error);
        assert (null != attempt);
        assert (null != attempts);
        assert (attempts.isNotEmpty);

        expect ((attempts[0].id == attempt.id), true);
      }
    );
  }
}
