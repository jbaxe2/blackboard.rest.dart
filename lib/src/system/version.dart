library blackboard.rest.system.version;

/// The [Version] class...
class Version {
  final int major;

  final int minor;

  final int patch;

  final String build;

  /// The [Version] constructor...
  Version (this.major, this.minor, this.patch, this.build);
}
