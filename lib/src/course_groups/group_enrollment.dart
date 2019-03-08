library blackboard.rest.groups.enrollment;

import 'group_enrollment_type.dart';
import 'signup_sheet.dart';

/// The [GroupEnrollment] class...
class GroupEnrollment {
  final GroupEnrollmentType type;

  final int limit;

  final SignupSheet signupSheet;

  /// The [GroupEnrollment] constructor...
  GroupEnrollment (this.type, {this.limit, this.signupSheet});
}
