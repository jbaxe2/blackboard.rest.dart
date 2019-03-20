library blackboard.rest.factory.system;

import '../../system/version.dart';
import '../../system/version_info.dart';

import '../error/invalid_version.dart';

import 'bb_rest_dto_factory.dart';

/// The [SystemFactory] class...
class SystemFactory implements BlackboardRestDtoFactory {
  /// The [SystemFactory] constructor...
  SystemFactory();

  /// The [createAll] method...
  @override
  Iterable<VersionInfo> createAll (
    covariant Iterable<Map<String, Object>> rawVersionInfos
  ) => null;

  /// The [create] method...
  @override
  VersionInfo create (covariant Map<String, Object> rawVersionInfo) {
    if (!rawVersionInfo.containsKey ('learn')) {
      throw new InvalidVersion ('Missing required information about the version.');
    }

    if (rawVersionInfo['learn'] is! Map) {
      throw new InvalidVersion (
        'The version infomration is not formatted correctly.'
      );
    }

    return _parseVersionInfo (rawVersionInfo);
  }

  /// The [_parseVersionInfo] method...
  VersionInfo _parseVersionInfo (covariant Map<String, Object> rawVersionInfo) =>
    new VersionInfo (_parseVersion (rawVersionInfo['learn']));

  /// The [_parseVersion] method...
  Version _parseVersion (covariant Map<String, Object> rawVersion) {
    if (!(rawVersion.containsKey ('major') &&
          rawVersion.containsKey ('minor') &&
          rawVersion.containsKey ('patch') &&
          rawVersion.containsKey ('build'))) {
      throw new InvalidVersion ('Missing required version information.');
    }

    return new Version (
      rawVersion['major'], rawVersion['minor'], rawVersion['patch'],
      rawVersion['build']
    );
  }
}
