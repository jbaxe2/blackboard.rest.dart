library blackboard.rest.groups.availability;

/// The [GroupAvailability] class...
class GroupAvailability {
  final GroupAvailable available;

  /// The [GroupAvailability] constructor...
  GroupAvailability (this.available);
}

/// The [GroupAvailable] enumeration...
enum GroupAvailable {
  Yes, No, SignupOnly
}
