library blackboard.rest.roles.system;

import 'role.dart';

/// The [SystemRole] class...
class SystemRole extends Role {
  /// The [SystemRole] constructor...
  SystemRole (
    String id, String roleId, String name, String description, bool custom
  ) : super (
    id, roleId, name, custom, description: description
  );
}
