@TestOn('vm')
library blackboard.rest.tests;

import 'package:test/test.dart';

import 'course_grades/course_grades_test.dart';
import 'course_memberships/course_memberships_test.dart';
import 'courses/courses_test.dart';
import 'oauth2/oauth2_test.dart';
import 'system/system_test.dart';
import 'terms/terms_test.dart';
import 'users/users_test.dart';

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
    //(new OAuth2Tester()).run();
    //(new SystemTester()).run();
    //(new TermsTester()).run();
    (new CoursesTester()).run();
    //(new UsersTester()).run();
    //(new CourseMembershipsTester()).run();
    //(new CourseGradesTester()).run();
  }
}
