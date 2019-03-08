library blackboard.rest.contents.availability;

import 'adaptive_release.dart';

/// The [ContentAvailability] class...
class ContentAvailability {
  final ContentAvailable available;

  final bool allowGuests;

  final AdaptiveRelease adaptiveRelease;

  /// The [ContentAvailability] constructor...
  ContentAvailability (this.available, this.allowGuests, this.adaptiveRelease);
}

/// The [ContentAvailable] enumeration...
enum ContentAvailable {
  Yes, No, PartiallyVisible
}
