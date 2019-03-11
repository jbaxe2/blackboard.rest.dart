library blackboard.rest.roles.institution;

import 'role.dart';

/// The [InstitutionRole] class...
class InstitutionRole extends Role {
  /// The [InstitutionRole] constructor...
  InstitutionRole (
    String id, String roleId, String name, String description, bool custom
  ) : super (id, roleId, name, custom, description: description);
}
