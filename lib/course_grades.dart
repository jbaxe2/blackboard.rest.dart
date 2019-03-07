library blackboard.rest.grades;

import 'dart:async' show Future;

import 'src/course_grades/attempt.dart';
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
}
