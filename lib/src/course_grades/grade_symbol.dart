library blackboard.rest.grades.symbol;

/// The [GradeSymbol] class...
class GradeSymbol {
  final String text;

  final double absoluteValue;

  final double lowerBound;

  final double upperBound;

  /// The [GradeSymbol] constructor...
  GradeSymbol (
    this.text, this.absoluteValue, this.lowerBound, this.upperBound
  );
}
