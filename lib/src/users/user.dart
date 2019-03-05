library blackboard.rest.users.user;

import 'name.dart';
import 'system_role.dart';
import 'user_availability.dart';

/// The [User] class...
class User {
  final String id;

  final String uuid;

  final String externalId;

  final String dataSourceId;

  final String userName;

  final String studentId;

  final DateTime created;

  final DateTime lastLogin;

  final List<String> institutionRoleIds;

  final List<SystemRole> systemRoleIds;

  final UserAvailability availability;

  final Name name;

  /// The [User] constructor...
  User (
    this.id, this.uuid, this.userName, this.created, this.lastLogin, this.name,
    {this.externalId, this.dataSourceId, this.studentId, this.systemRoleIds,
     this.institutionRoleIds, this.availability}
  );
}
