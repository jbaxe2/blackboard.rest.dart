library blackboard.rest.factory.dto;

/// The [BlackboardRestDtoFactory] abstract class...
abstract class BlackboardRestDtoFactory {
  /// The [create] method...
  Object create (covariant Map<String, Object> rawDataTransferObject);

  /// The [createAll] method...
  Iterable<Object> createAll (
    covariant Iterable<Map<String, Object>> rawDataTransferObjects
  );
}
