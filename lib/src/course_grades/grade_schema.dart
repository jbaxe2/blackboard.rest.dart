library blackboard.rest.grades.schema;

import 'grade_symbol.dart';
import 'scale_type.dart';

/// The [GradeSchema] class...
class GradeSchema {
  final String id;

  final String externalId;

  final String title;

  final String description;

  final ScaleType scaleType;

  final Iterable<GradeSymbol> symbols;

  /// The [GradeSchema] constructor...
  GradeSchema (
    this.id, this.title, this.scaleType,
    {this.externalId, this.description, this.symbols}
  );
}
