library blackboard.rest.users.user;

import '../_scaffolding/util/mappable.dart';

import 'name.dart';
import 'system_role.dart';
import 'user_availability.dart';

/// The [User] class...
class User implements Mappable {
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

  /// The [toMap] method...
  @override
  Map<String, Object> toMap() {
    return new Map<String, Object>()
      ..['id'] = id
      ..['uuid'] = uuid
      ..['userName'] = userName
      ..['created'] = created.toUtc().toString()
      ..['lastLogin'] = lastLogin.toUtc().toString()
      ..['name'] = name.toMap();
  }
}
