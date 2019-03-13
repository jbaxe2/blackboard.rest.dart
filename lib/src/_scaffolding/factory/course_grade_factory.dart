library blackboard.rest.factory.course_grade;

import '../../course_grades/grade_column.dart';

import '../error/invalid_grade.dart';

import 'bb_rest_dto_factory.dart';

/// The [CourseGradeFactory] class...
class CourseGradeFactory implements BlackboardRestDtoFactory {
  /// The [CourseGradeFactory] constructor...
  CourseGradeFactory();

  /// The [createAll] method...
  @override
  Iterable<GradeColumn> createAll (covariant Iterable<Map<String, Object>> rawColumns) {
    var gradeColumns = new List<GradeColumn>();

    rawColumns.forEach ((rawColumn) => gradeColumns.add (create (rawColumn)));

    return gradeColumns;
  }

  /// The [create] method...
  @override
  GradeColumn create (covariant Map<String, Object> rawColumn) {
    if (!(rawColumn.containsKey ('id'))) {
      throw new InvalidGrade (
        'Missing required information relating to the grade column.'
      );
    }

    return _parseGradeColumn (rawColumn);
  }

  /// The [_parseGradeColumn] method...
  GradeColumn _parseGradeColumn (Map<String, Object> rawColumn) {
    ;
  }
}
