library blackboard.rest.factories.dto;

/// The [BlackboardRestDtoFactory] abstract class...
abstract class BlackboardRestDtoFactory {
  /// The [create] static method...
  Object create (Map<String, Object> rawDataTransferObject);
}