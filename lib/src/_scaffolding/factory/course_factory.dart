library blackboard.rest.factories.course;

import '../../courses/course.dart';
import '../../courses/ultra_status.dart';

import '../error/invalid_course.dart';

import 'bb_rest_dto_factory.dart';

/// The [CourseFactory] class...
class CourseFactory implements BlackboardRestDtoFactory {
  /// The [create] method...
  @override
  Course create (Map<String, Object> rawCourse) {
    if (!(rawCourse.containsKey ('id') &&
          rawCourse.containsKey ('uuid') &&
          rawCourse.containsKey ('courseId') &&
          rawCourse.containsKey ('name') &&
          rawCourse.containsKey ('created') &&
          rawCourse.containsKey ('organization') &&
          rawCourse.containsKey ('hasChildren') &&
          rawCourse.containsKey ('parentId') &&
          rawCourse.containsKey ('externalAccessUrl') &&
          rawCourse.containsKey ('guestAccessUrl'))) {
      throw new InvalidCourse ('Missing required information for the course.');
    }

    return _parseCourse (rawCourse);
  }

  /// The [_parseCourse] method...
  Course _parseCourse (Map<String, Object> rawCourse) {
    var course = new Course (
      rawCourse['id'], rawCourse['uuid'], rawCourse['courseId'], rawCourse['name'],
      DateTime.parse (rawCourse['created']), rawCourse['organization'],
      rawCourse['hasChildren'], rawCourse['parentId'],
      rawCourse['externalAccessUrl'], rawCourse['guestAccessUrl']
    );

    return course;
  }

  /// The [_establishOptionalParams] method...
  Map<String, Object> _establishOptionalParams (Map<String, Object> rawCourse) {
    var optionalParams = new Map<String, Object>()
      ..['externalId'] = ''
      ..['dataSourceId'] = ''
      ..['description'] = ''
      ..['ultraStatus'] = UltraStatus;

    if (rawCourse.containsKey ('externalId')) {
      optionalParams;
    }

    return optionalParams;
  }
}
