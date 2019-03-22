library blackboard.rest.implementation.grades;

import 'dart:async' show Future;

import '../../course_grades.dart';

import '../_scaffolding/configuration/endpoints.dart' show course_grades;

import '../_scaffolding/error/invalid_grade.dart';

import '../_scaffolding/factory/course_grades/column_attempt_factory.dart';
import '../_scaffolding/factory/course_grades/grade_column_factory.dart';

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
  @override
  Future<Iterable<GradeColumn>> getGradeColumns (String courseId) async {
    String endpoint = course_grades['get_grade_columns']
      .replaceFirst ('{courseId}', courseId);

    Iterable<Object> rawGrades;

    try {
      rawGrades =
        (await connector.sendBbRestRequest (endpoint, useVersion: 2) as Map)['results'];
    } catch (e) {
      throw throwError (e);
    }

    return (new GradeColumnFactory()).createAll (rawGrades.cast());
  }

  /// The [createGradeColumn] method...
  @override
  Future<void> createGradeColumn (String courseId, GradeColumn gradeColumn) async {}

  /// The [getGradeColumn] method...
  @override
  Future<GradeColumn> getGradeColumn (String courseId, String columnId) async {
    String endpoint = course_grades['get_grade_column']
      .replaceFirst ('{courseId}', courseId)
      .replaceFirst ('{columnId}', columnId);

    Object rawGrade;

    try {
      rawGrade = await connector.sendBbRestRequest (endpoint, useVersion: 2);
    } catch (e) {
      throw throwError (e);
    }

    return (new GradeColumnFactory()).create (rawGrade);
  }

  /// The [updateGradeColumn] method...
  @override
  Future<void> updateGradeColumn (
    String courseId, String columnId, GradeColumn gradeColumn
  ) async {}

  /// The [getColumnAttempts] method...
  @override
  Future<Iterable<Attempt>> getColumnAttempts (
    String courseId, String columnId
  ) async {
    String endpoint = course_grades['get_column_attempts']
      .replaceFirst ('{courseId}', courseId)
      .replaceFirst ('{columnId}', columnId);

    Iterable<Object> rawGrades;

    try {
      rawGrades =
        (await connector.sendBbRestRequest (endpoint, useVersion: 2) as Map)['results'];
    } catch (e) {
      throw throwError (e);
    }

    return (new ColumnAttemptFactory()).createAll (rawGrades.cast());
  }

  /// The [createColumnAttempt] method...
  @override
  Future<void> createColumnAttempt (String columnId, Attempt attempt) async {}

  /// The [getColumnAttempt] method...
  @override
  Future<Attempt> getColumnAttempt (
    String courseId, String columnId, String attemptId
  ) async {
    String endpoint = course_grades['get_column_attempt']
      .replaceFirst ('{courseId}', courseId)
      .replaceFirst ('{columnId}', columnId)
      .replaceFirst ('{attemptId}', attemptId);

    Object rawGrade;

    try {
      rawGrade = await connector.sendBbRestRequest (endpoint, useVersion: 2);
    } catch (e) {
      throw throwError (e);
    }

    return (new ColumnAttemptFactory()).create (rawGrade);
  }

  /// The [updateColumnAttempt] method...
  @override
  Future<void> updateColumnAttempt (
    String columnId, String attemptId, Attempt attempt
  ) async {}

  /// The [getColumnGrades] method...
  @override
  Future<Iterable<Grade>> getColumnGrades (String courseId, String columnId) async {}

  /// The [getColumnGradeLastChanged] method...
  @override
  Future<Grade> getColumnGradeLastChanged (String courseId, String columnId) async {}

  /// The [getColumnGrade] method...
  @override
  Future<Grade> getColumnGrade (String courseId, String columnId, String userId) async {}

  /// The [updateColumnGrade] method...
  @override
  Future<void> updateColumnGrade (
    String courseId, String columnId, String userId, Grade grade
  ) async {}

  /// The [getUserGrades] method...
  @override
  Future<Iterable<Grade>> getUserGrades (String courseId, String userId) async {}

  /// The [throwError] method...
  @override
  InvalidGrade throwError (covariant BlackboardRestException error) {
    return new InvalidGrade (
      error.message, status: error?.status, code: error?.code,
      developerMessage: error?.developerMessage, extraInfo: error?.extraInfo
    );
  }
}
