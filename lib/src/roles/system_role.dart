library blackboard.rest.roles.system;

/// The [SystemRole] class...
class SystemRole {
  final String id;

  final String roleId;

  final String name;

  final String description;

  final bool custom;

  /// The [SystemRole] constructor...
  SystemRole (
    this.id, this.roleId, this.name, this.custom,
    {this.description}
  );
}
