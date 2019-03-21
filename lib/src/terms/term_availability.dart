library blackboard.rest.terms.availability;

import 'term_duration.dart';

/// The [TermAvailability] class...
class TermAvailability {
  Availability available;

  TermDuration duration;

  /// The [TermAvailability] constructor...
  TermAvailability ({this.available, this.duration});
}

/// The [Availability] enumeration...
enum Availability {
  Yes, No
}
