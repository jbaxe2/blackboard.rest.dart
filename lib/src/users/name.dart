library blackboard.rest.users.name;

import '../_scaffolding/util/mappable.dart';

/// The [Name] class...
class Name implements Mappable {
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

  /// The [toMap] method...
  @override
  Map<String, String> toMap() {
    return new Map<String, String>()
      ..['given'] = given
      ..['family'] = family;
  }
}
