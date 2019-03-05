library blackboard.rest.users.name;

/// The [Name] class...
class Name {
  final String given;

  final String family;

  final String middle;

  final String other;

  final String suffix;

  final String title;

  /// The [Name] constructor...
  Name (
    this.given, this.family,
    {this.middle, this.other, this.suffix, this.title}
  );
}
