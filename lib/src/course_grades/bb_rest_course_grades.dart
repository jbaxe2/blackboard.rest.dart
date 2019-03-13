library blackboard.rest.implementation.grades;

import 'dart:async' show Future;

import '../../course_grades.dart';

import '../_scaffolding/configuration/endpoints.dart' show course_grades;
import '../_scaffolding/factory/course_grade_factory.dart';
import '../_scaffolding/bb_rest_services.dart';

import '../oauth2/access_token.dart';

import 'attempt.dart';
import 'grade.dart';
import 'grade_column.dart';

/// The [BbRestCourseGrades] class...
class BbRestCourseGrades extends BlackboardRestServices implements CourseGrades {
  /// The [BbRestCourseGrades] constructor...
  BbRestCourseGrades (String host, AccessToken token) : super (host, token);

  /// The [getGradeColumns] method...
  Future<Iterable<GradeColumn>> getGradeColumns (String courseId) async {
    String endpoint = course_grades['get_grade_columns']
      .replaceFirst ('{courseId}', courseId);

    Iterable<Object> rawResults =
      await connector.sendBbRestRequest (endpoint, useVersion: 2);

    return (new CourseGradeFactory()).createAll (rawResults);
  }

  /// The [createGradeColumn] method...
  Future<void> createGradeColumn (String courseId, GradeColumn gradeColumn) async {}

  /// The [getGradeColumn] method...
  Future<GradeColumn> getGradeColumn (String courseId, String columnId) async {
    String endpoint = course_grades['get_grade_column']
      .replaceFirst ('{courseId', courseId)
      .replaceFirst ('{columnId}', columnId);

    Object rawResult = await connector.sendBbRestRequest (endpoint, useVersion: 2);
  }

  /// The [updateGradeColumn] method...
  Future<void> updateGradeColumn (
    String courseId, String columnId, GradeColumn gradeColumn
  ) async {}

  /// The [getColumnAttempts] method...
  Future<Iterable<Attempt>> getColumnAttempts (
    String courseId, String columnId
  ) async {}

  /// The [createColumnAttempt] method...
  Future<void> createColumnAttempt (String columnId, Attempt attempt) async {}

  /// The [getColumnAttempt] method...
  Future<Attempt> getColumnAttempt (
    String courseId, String columnId, String attemptId
  ) async {}

  /// The [updateColumnAttempt] method...
  Future<void> updateColumnAttempt (
    String columnId, String attemptId, Attempt attempt
  ) async {}

  /// The [getColumnGrades] method...
  Future<Iterable<Grade>> getColumnGrades (String courseId, String columnId) async {}

  /// The [getColumnGradeLastChanged] method...
  Future<Grade> getColumnGradeLastChanged (String courseId, String columnId) async {}

  /// The [getColumnGrade] method...
  Future<Grade> getColumnGrade (String courseId, String columnId, String userId) async {}

  /// The [updateColumnGrade] method...
  Future<void> updateColumnGrade (
    String courseId, String columnId, String userId, Grade grade
  ) async {}

  /// The [getUserGrades] method...
  Future<Iterable<Grade>> getUserGrades (String courseId, String userId) async {}
}
