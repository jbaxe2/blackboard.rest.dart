@TestOn('vm')
library blackboard.rest.tests.system;

import 'package:test/test.dart';

import 'package:blackboard.rest/src/system/bb_rest_system.dart';
import 'package:blackboard.rest/src/system/version.dart';
import 'package:blackboard.rest/src/system/version_info.dart';

import 'package:blackboard.rest/system.dart';

import '../test_authorizer.dart';
import '../testable.dart';

/// The [SystemTester] class...
class SystemTester extends TestAuthorizer implements Testable {
  /// The [SystemTester] constructor...
  SystemTester();

  /// The [run] method...
  @override
  void run() {
    group ('System:', () {
      _testGetValidSystemInstance();
      _testGetVersion();
    });
  }

  /// The [_testGetValidSystemInstance] method...
  void _testGetValidSystemInstance() {
    test ('Get a valid system service instance.', () async {
      System systemService = getSystemInstance (
        host, await authorizeForTests()
      );

      assert (null != systemService);
      expect ((systemService is BbRestSystem), true);
    });
  }

  /// The [_testGetVersion] method...
  void _testGetVersion() {
    test ('Get the Blackboard Learn version information.', () async {
      System systemService = getSystemInstance (
        host, await authorizeForTests()
      );

      Exception error;
      VersionInfo versionInfo;

      try {
        versionInfo = await systemService.getVersion();
      } catch (e) {
        error = e;
      }

      assert (null == error);
      assert (null != versionInfo);
      assert (versionInfo.learn is Version);

      bool haveVersionValues =
        (null != versionInfo.learn.major) && (null != versionInfo.learn.minor) &&
        (null != versionInfo.learn.patch) && (null != versionInfo.learn.build);

      expect (haveVersionValues, true);
    });
  }
}
