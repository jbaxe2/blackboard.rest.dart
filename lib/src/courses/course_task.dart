library blackboard.rest.courses.task;

import 'course_task_status.dart';

/// The [CourseTask] class...
class CourseTask {
  final String id;

  final CourseTaskStatus status;

  final int percentComplete;

  final DateTime started;

  /// The [CourseTask] constructor...
  CourseTask (this.id, this.status, this.percentComplete, this.started);
}
