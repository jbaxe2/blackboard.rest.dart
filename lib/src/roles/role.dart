library blackboard.rest.roles.role;

/// The [Role] class...
class Role {
  final String id;

  final String roleId;

  final String name;

  final String description;

  final bool custom;

  /// The [Role] constructor...
  Role (this.id, this.roleId, this.name, this.custom, {this.description});
}
