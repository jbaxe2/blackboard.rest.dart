library blackboard.rest.factory.course_grades.grade_column;

import '../../../course_grades/grade_availability.dart';
import '../../../course_grades/grade_column.dart';
import '../../../course_grades/grading.dart';
import '../../../course_grades/grading_type.dart';
import '../../../course_grades/score.dart';

import '../../error/invalid_grade.dart';

import '../bb_rest_dto_factory.dart';

/// The [GradeColumnFactory] class...
class GradeColumnFactory implements BlackboardRestDtoFactory {
  /// The [GradeColumnFactory] constructor...
  GradeColumnFactory();

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
    if (!(rawColumn.containsKey ('id') &&
          rawColumn.containsKey ('name') &&
          rawColumn.containsKey ('score') &&
          rawColumn.containsKey ('availability') &&
          rawColumn.containsKey ('grading'))) {
      throw new InvalidGrade (
        'Missing required information relating to the grade column.'
      );
    }

    return _parseGradeColumn (rawColumn);
  }

  /// The [_parseGradeColumn] method...
  GradeColumn _parseGradeColumn (covariant Map<String, Object> rawColumn) {
    return new GradeColumn (
      rawColumn['id'], rawColumn['name'], _parseScore (rawColumn['score']),
      _parseAvailability (rawColumn['availability']),
      _parseGrading (rawColumn['grading'])
    );
  }

  /// The [_parseScore] method...
  Score _parseScore (covariant Map<String, Object> rawScore) {
    return new Score (rawScore['possible']);
  }

  /// The [_parseAvailability] method...
  GradeAvailability _parseAvailability (covariant Map<String, Object> rawAvailability) {
    GradeAvailability availability;

    if (rawAvailability.containsKey ('available')) {
      if ('yes' == rawAvailability['available'].toString().toLowerCase()) {
        availability = GradeAvailability.Yes;
      } else {
        availability = GradeAvailability.No;
      }
    }

    return availability ?? GradeAvailability.No;
  }

  /// The [_parseGrading] method...
  Grading _parseGrading (covariant Map<String, Object> rawGrading) {
    if (!(rawGrading.containsKey ('type') &&
          rawGrading.containsKey ('schemaId'))) {
      throw new InvalidGrade (
        'Missing information relating to the grading setup.'
      );
    }

    return new Grading (GradingType.Attempts, rawGrading['schemaId']);
  }
}
