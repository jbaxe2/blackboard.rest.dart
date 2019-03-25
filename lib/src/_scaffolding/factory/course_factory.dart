library blackboard.rest.factory.course;

import '../../courses/course.dart';
import '../../courses/ultra_status.dart';

import '../error/invalid_course.dart';

import 'bb_rest_dto_factory.dart';

/// The [CourseFactory] class...
class CourseFactory implements BlackboardRestDtoFactory {
  /// The [CourseFactory] constructor...
  CourseFactory();

  /// The [createAll] method...
  @override
  Iterable<Course> createAll (covariant Iterable<Map<String, Object>> rawCourses) {
    var courses = new List<Course>();

    rawCourses.forEach ((rawCourse) => courses.add (create (rawCourse)));

    return courses;
  }

  /// The [create] method...
  @override
  Course create (covariant Map<String, Object> rawCourse) {
    print ('here for create course');
    if (!(rawCourse.containsKey ('id') &&
          rawCourse.containsKey ('uuid') &&
          rawCourse.containsKey ('courseId') &&
          rawCourse.containsKey ('externalId') &&
          rawCourse.containsKey ('name') &&
          rawCourse.containsKey ('created') &&
          rawCourse.containsKey ('organization') &&
          rawCourse.containsKey ('externalAccessUrl'))) {
      throw new InvalidCourse ('Missing required information for the course.');
    }

    return _parseCourse (rawCourse);
  }

  /// The [_parseCourse] method...
  Course _parseCourse (covariant Map<String, Object> rawCourse) {
    return new Course (
      rawCourse['id'], rawCourse['uuid'], rawCourse['courseId'],
      rawCourse['externalId'], rawCourse['name'],
      DateTime.parse (rawCourse['created']), rawCourse['organization'],
      rawCourse['externalAccessUrl']
    );
  }

  /// The [_establishOptionalParams] method...
  Map<String, Object> _establishOptionalParams (
    covariant Map<String, Object> rawCourse
  ) {
    var optionalParams = new Map<String, Object>()
      ..['dataSourceId'] = ''
      ..['description'] = ''
      ..['ultraStatus'] = UltraStatus;

    if (rawCourse.containsKey ('externalId')) {
      optionalParams;
    }

    return optionalParams;
  }
}
