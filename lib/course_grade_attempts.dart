library blackboard.rest.grades.attempts;

import 'dart:async' show Future;

import 'src/course_grades/attempts/attempt_file.dart';
import 'src/course_grades/attempts/uploaded_file.dart';

/// The [CourseGradeAttempts] abstract class...
abstract class CourseGradeAttempts {
  /// The [getAttemptFileMetadataList] abstract method...
  Future<Iterable<AttemptFile>> getAttemptFileMetadataList (
    String courseId, String attemptId
  );

  /// The [attachFile] abstract method...
  Future<bool> attachFile (
    String courseId, String attemptId, UploadedFile uploadedFile
  );
}
