library blackboard.rest.exception;

/// The [BlackboardRestException] class...
class BlackboardRestException implements Exception {
  final int status;

  final String code;

  final String message;

  final String developerMessage;

  final String extraInfo;

  /// The [BlackboardRestException] constructor...
  BlackboardRestException (
    this.message,
    {this.status, this.code, this.developerMessage, this.extraInfo}
  );
}
