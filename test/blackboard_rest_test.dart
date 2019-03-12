@TestOn('vm')
library blackboard.rest.tests;

import 'package:test/test.dart';

import 'oauth2/oauth2_test.dart';

import 'testable.dart';

/// The [main] function...
void main() => (_BbRestTester()).run();

/// The [_BbRestTester] class...
class _BbRestTester implements Testable {
  /// The [_BbRestTester] constructor...
  _BbRestTester();

  /// The [run] method...
  @override
  void run() {
    (new OAuth2Tester()).run();
  }
}
