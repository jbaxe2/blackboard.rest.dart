library blackboard.rest.grades.notations;

import 'dart:async' show Future;

import 'src/course_grades/notations/grade_notation.dart';

/// The [CourseGradeNotations] abstract class...
abstract class CourseGradeNotations {
  /// The [getCourseGradeNotations] abstract method...
  Future<Iterable<GradeNotation>> getCourseGradeNotations (String courseId);

  /// The [createCourseGradeNotation] abstract method...
  Future<void> createCourseGradeNotation (
    String courseId, GradeNotation gradeNotation
  );

  /// The [getCourseGradeNotation] abstract method...
  Future<GradeNotation> getCourseGradeNotation (
    String courseId, String gradeNotationId
  );

  /// The [updateCourseGradeNotation] abstract method...
  Future<void> updateCourseGradeNotation (
    String courseId, String gradeNotationId, GradeNotation gradeNotation
  );
}
