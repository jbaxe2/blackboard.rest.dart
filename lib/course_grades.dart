library blackboard.rest.grades;

import 'dart:async' show Future;

import 'src/course_grades/attempt.dart';
import 'src/course_grades/grade.dart';
import 'src/course_grades/grade_column.dart';

/// The [CourseGrades] abstract class...
abstract class CourseGrades {
  /// The [getGradeColumns] abstract method...
  Future<Iterable<GradeColumn>> getGradeColumns (String courseId);

  /// The [createGradeColumn] abstract method...
  Future<bool> createGradeColumn (String courseId, GradeColumn gradeColumn);

  /// The [getGradeColumn] abstract method...
  Future<GradeColumn> getGradeColumn (String courseId, String columnId);

  /// The [updateGradeColumn] abstract method...
  Future<bool> updateGradeColumn (
    String courseId, String columnId, GradeColumn gradeColumn
  );

  /// The [getColumnAttempts] abstract method...
  Future<Iterable<Attempt>> getColumnAttempts (
    String courseId, String columnId
  );

  /// The [createColumnAttempt] method...
  Future<bool> createColumnAttempt (String columnId, Attempt attempt);

  /// The [getColumnAttempt] method...
  Future<Attempt> getColumnAttempt (
    String courseId, String columnId, String attemptId
  );

  /// The [updateColumnAttempt] method...
  Future<bool> updateColumnAttempt (
    String columnId, String attemptId, Attempt attempt
  );

  /// The [getColumnGrades] method...
  Future<Iterable<Grade>> getColumnGrades (String courseId, String columnId);

  /// The [getColumnGradeLastChanged] method...
  Future<Grade> getColumnGradeLastChanged (String courseId, String columnId);

  /// The [getColumnGrade] method...
  Future<Grade> getColumnGrade (String courseId, String columnId, String userId);

  /// The [updateColumnGrade] method...
  Future<bool> updateColumnGrade (
    String courseId, String columnId, String userId, Grade grade
  );

  /// The [getUserGrades] method...
  Future<Iterable<Grade>> getUserGrades (String courseId, String userId);
}
