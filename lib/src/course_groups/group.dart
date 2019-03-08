library blackboard.rest.groups.group;

import 'group_availability.dart';
import 'group_enrollment.dart';

/// The [Group] class...
class Group {
  final String id;

  final String externalId;

  final String parentId;

  final String name;

  final String description;

  final GroupAvailability availability;

  final GroupEnrollment enrollment;

  /// The [Group] constructor...
  Group (
    this.id, this.name, this.enrollment,
    {this.externalId, this.parentId, this.description, this.availability}
  );
}
