library blackboard.rest.courses.child;

/// The [CourseChild] class...
class CourseChild {
  final String id;

  final String parentId;

  final String dataSourceId;

  final DateTime created;

  /// The [CourseChild] constructor...
  CourseChild (this.id, this.parentId, this.created, {this.dataSourceId});
}
