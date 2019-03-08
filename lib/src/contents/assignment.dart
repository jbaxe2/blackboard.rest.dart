library blackboard.rest.contents.assignment;

import '../course_grades/grading.dart';
import '../course_grades/score.dart';

import 'content_availability.dart';

/// The [Assignment] class...
class Assignment {
  final String id;

  final String parentId;

  final String title;

  final String instructions;

  final String description;

  final int position;

  final Iterable<String> fileUploadIds;

  final ContentAvailability availability;

  final Grading grading;

  final Score score;

  /// The [Assignment] constructor...
  Assignment (
    this.id, this.title,
    {this.parentId, this.instructions, this.description, this.position,
     this.fileUploadIds, this.availability, this.grading, this.score}
  );
}
