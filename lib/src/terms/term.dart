library blackboard.rest.terms.term;

import 'term_availability.dart';

/// The [Term] class...
class Term {
  final String id;

  final String externalId;

  final String dataSourceId;

  final String name;

  final String description;

  final TermAvailability availability;

  /// The [Term] constructor...
  Term (
    this.id, this.externalId, this.name,
    {this.dataSourceId, this.description, this.availability}
  );
}
