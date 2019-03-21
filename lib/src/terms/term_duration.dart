library blackboard.rest.terms.duration;

/// The [TermDuration] class...
class TermDuration {
  final DurationType type;

  final DateTime start;

  final DateTime end;

  final int daysOfUse;

  /// The [TermDuration] constructor...
  TermDuration ({this.type, this.start, this.end, this.daysOfUse});
}

/// The [DurationType] enumeration...
enum DurationType {
  Continuous, DateRange, FixedNumDays
}
