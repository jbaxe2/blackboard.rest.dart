library blackboard.rest.configuration.endpoints;

/// The base endpoint for all REST API calls...
const String base = '/learn/api/public/v1/';

const String baseV2 = '/learn/api/public/v2/';

/// The oauth endpoints...
const Map<String, String> oauth2 = {
  'authorization_code': 'oauth2/authorizationcode',
  'request_token': 'oauth2/token'
};

/// The announcements endpoints...
const Map<String, String> announcements = {
  'get_announcements': 'announcements',
  'get_announcement': 'announcements/{announcementId}'
};

/// The course grade attempts endpoints...
const Map<String, String> course_grade_attempts = {
  'get_attempt_file_metadata_list': 'courses/{courseId}/gradebook/attempts/{attemptId}/files',
  'attach_attempt_file': 'courses/{courseId}/gradebook/attempts/{attemptId}/files',
  'get_attempt_file_metadata': 'courses/{courseId}/gradebook/attempts/{attemptId}/files/{attemptFileId}',
  'download': 'courses/{courseId}/gradebook/attempts/{attemptId}/files/{attemptFileId}/download'
};

/// The course grades endpoints...
const Map<String, String> course_grades = {
  'get_grade_columns': 'courses/{courseId}/gradebook/columns',
  'get_grade_column': 'courses/{courseId}/gradebook/columns/{columnId}',
  'get_column_attempts': 'courses/{courseId}/gradebook/columns/{columnId}/attempts',
  'get_column_attempt': 'courses/{courseId}/gradebook/columns/{columnId}/attempts/{attemptId}'
};

/// The course memberships endpoints...
const Map<String, String> course_memberships = {
  'get_course_memberships': 'courses/{courseId}/users',
  'get_membership': 'courses/{courseId}/users/{userId}',
  'get_user_memberships': 'users/{userId}/courses'
};

/// The courses endpoints...
const Map<String, String> courses = {
  'get_courses': 'courses',
  'get_course': 'courses/{courseId}',
  'get_children': 'courses/{courseId}/children',
  'get_child': 'courses/{courseId}/children/{childCourseId}',
  'copy_course': 'courses/{courseId}/copy',
  'get_cross_list_set': 'courses/{courseId}/crossListSet',
  'get_task': 'courses/{courseId}/tasks/{taskId}'
};

/// The system endpoints...
const Map<String, String> system = {
  'get_version': 'system/version'
};

/// The terms endpoints...
const Map<String, String> terms = {
  'terms': 'terms',
  'term': 'terms/{termId}'
};

/// The users endpoints
const Map<String, String> users = {
  'users': 'users',
  'user': 'users/{userId}'
};
