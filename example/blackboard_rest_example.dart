library blackboard.rest.example;

import 'package:blackboard.rest/blackboard_rest.dart';

/// Run the examples.  Note that the examples 'as is' will not run properly,
/// since to do so depends on proper Blackboard Learn host, application ID, and
/// application secret; course ID's; whatever other required info that will be
/// dependent on a particular institution's Learn/REST setup.
void main() {
  doGetCourseExample();
  doGetColumnAttemptExample();
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
  /// acting as an application, 'client_credentials' is always used.  Creating a
  /// token only has to be done once, and can be reused for whichever different
  /// services will be used.
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

/// The [doGetColumnAttemptExample] function shows how to use the blackboard.rest
/// library to retrieve a user's submission attempt for some gradable content in
/// some course.  The steps involved include obtaining the access token and an
/// instance of the course grades service.  Then retrieve the columns, retrieve a
/// list of attempts for a particular column, and then retrieve a particular
/// attempt based on an ID obtained from that list.
void doGetColumnAttemptExample() async {
  /// Create the oauth2 instance to handle authentication with the Learn server
  /// and the REST API application.
  ///
  /// Replace the 'host', 'clientId', and 'secret' with appropriate values.
  BlackboardRestOAuth2 oauth2 = getOAuth2Instance (
    Uri.parse ('host'), 'clientId', 'secret'
  );

  /// Create a token that will be used in future requests.  In this instance we
  /// are acting on behalf of an application, and not a particular user.  When
  /// acting as an application, 'client_credentials' is always used.  Creating a
  /// token only has to be done once, and can be reused for whichever different
  /// services will be used.
  AccessToken token = await oauth2.requestToken ('client_credentials');

  /// Create an instance of the Course Grades service to interact with the
  /// grade center.  All services require the host name and the previously
  /// created access token upon creation of the service's instance.
  CourseGrades gradesService = getCourseGradesInstance ('host', token);

  /// Obtain the grade columns for a particular course, as designated by the
  /// course ID (as displayed in the GUI).
  List<GradeColumn> gradeColumns = await gradesService.getGradeColumns (
    'courseId:some_course_id'
  );

  /// Obtain the list of attempts for a particular grade column (in this case,
  /// we attempt to retrieve the list of attempts for the first column).  The
  /// list of attempts here contain limited information, to be used for retrieving
  /// a full attempt.
  List<Attempt> columnAttempts = await gradesService.getColumnAttempts (
    'courseId:some_course_id', gradeColumns[0].id
  );

  /// Obtain a single attempt for a grade center column, in this case the first
  /// attempt for the first column in the grade center.
  Attempt columnAttempt = await gradesService.getColumnAttempt (
    'courseId:some_course_id', gradeColumns[0].id, columnAttempts[0].id
  );

  /// Print out a few properties relating to the attempt.
  print ('Column name: ${gradeColumns[0].name}');
  print ('User ID (internal): ${columnAttempt.userId}');
  print ('Submission date: ${columnAttempt.created}');
  print ('Submission attempt: ${columnAttempt.studentSubmission}');
}
