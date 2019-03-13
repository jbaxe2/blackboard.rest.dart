library blackboard.rest.grades;

import 'dart:async' show Future;

import 'src/course_grades/attempt.dart';
import 'src/course_grades/bb_rest_course_grades.dart';
import 'src/course_grades/grade.dart';
import 'src/course_grades/grade_column.dart';

import 'src/oauth2/access_token.dart';

export 'src/course_grades/attempt.dart';
export 'src/course_grades/grade.dart';
export 'src/course_grades/grade_column.dart';

/// The [getCourseGradesInstance] function...
CourseGrades getCourseGradesInstance (String host, AccessToken token) =>
  new BbRestCourseGrades (host, token);

/// The [CourseGrades] abstract class...
abstract class CourseGrades {
  /// The [getGradeColumns] abstract method...
  Future<Iterable<GradeColumn>> getGradeColumns (String courseId);

  /// The [createGradeColumn] abstract method...
  Future<void> createGradeColumn (String courseId, GradeColumn gradeColumn);

  /// The [getGradeColumn] abstract method...
  Future<GradeColumn> getGradeColumn (String courseId, String columnId);

  /// The [updateGradeColumn] abstract method...
  Future<void> updateGradeColumn (
    String courseId, String columnId, GradeColumn gradeColumn
  );

  /// The [getColumnAttempts] abstract method...
  Future<Iterable<Attempt>> getColumnAttempts (
    String courseId, String columnId
  );

  /// The [createColumnAttempt] abstract method...
  Future<void> createColumnAttempt (String columnId, Attempt attempt);

  /// The [getColumnAttempt] abstract method...
  Future<Attempt> getColumnAttempt (
    String courseId, String columnId, String attemptId
  );

  /// The [updateColumnAttempt] abstract method...
  Future<void> updateColumnAttempt (
    String columnId, String attemptId, Attempt attempt
  );

  /// The [getColumnGrades] abstract method...
  Future<Iterable<Grade>> getColumnGrades (String courseId, String columnId);

  /// The [getColumnGradeLastChanged] abstract method...
  Future<Grade> getColumnGradeLastChanged (String courseId, String columnId);

  /// The [getColumnGrade] abstract method...
  Future<Grade> getColumnGrade (String courseId, String columnId, String userId);

  /// The [updateColumnGrade] abstract method...
  Future<void> updateColumnGrade (
    String courseId, String columnId, String userId, Grade grade
  );

  /// The [getUserGrades] abstract method...
  Future<Iterable<Grade>> getUserGrades (String courseId, String userId);
}
