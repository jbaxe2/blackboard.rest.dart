library blackboard.rest.grades.anonymous;

import 'anonymous_grading_type.dart';

/// The [AnonymousGrading] class...
class AnonymousGrading {
  final AnonymousGradingType type;

  final DateTime releaseAfter;

  /// The [AnonymousGrading] constructor...
  AnonymousGrading (this.type, {this.releaseAfter});
}
