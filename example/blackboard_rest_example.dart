library blackboard.rest.example;

import 'package:blackboard.rest/blackboard_rest.dart';

/// Run the examples.
void main() {
  doGetCourseExample();
}

/// The [doGetCourseExample] function shows how to use the blackboard.rest
/// library to retrieve a single course.  It only takes (essentially) four lines
/// of code (including authorization) to obtain a single course from the service.
void doGetCourseExample() async {
  /// Create the oauth2 instance to handle authentication with the Learn server
  /// and the REST API application.
  ///
  /// Replace the 'host', 'clientId', and 'secret' with appropriate values.
  BlackboardRestOAuth2 oauth2 = getOAuth2Instance (
    Uri.parse ('host'), 'clientId', 'secret'
  );

  /// Create a token that will be used in future requests.  In this instance we
  /// are acting on behalf of an application, and not a particular user.  When
  /// acting as an application, 'client_credentials' is always used.
  AccessToken token = await oauth2.requestToken ('client_credentials');

  /// Create an instance of the Courses service to interact with courses.  All
  /// services require the host name and the previously created access token
  /// upon creation of the service's instance.
  Courses courseService = getCoursesInstance ('host', token);

  /// Obtain a single course based on its course ID (as displayed in the GUI).
  Course course = await courseService.getCourse ('courseId:some_course_id');

  /// Print out a few properties for the course.
  print ('Course name: ${course.name}.');
  print ('Course external ID: ${course.externalId}.');
  print ('Course created date: ${course.created.toIso8601String()}.');
}
