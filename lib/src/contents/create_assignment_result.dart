library blackboard.rest.contents.create_assignment_result;

/// The [CreateAssignmentResult] class...
class CreateAssignmentResult {
  final String contentId;

  final String gradeColumnId;

  final String assessmentId;

  final Iterable<String> questionIds;

  /// The [CreateAssignmentResult] constructor...
  CreateAssignmentResult (
    this.contentId, this.gradeColumnId, this.assessmentId, this.questionIds
  );
}
