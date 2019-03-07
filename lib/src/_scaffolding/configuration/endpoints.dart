library blackboard.rest.configuration.endpoints;

/// The base endpoint for all REST API calls...
const String base = '/learn/api/public/v1/';

const String baseV2 = '/learn/api/public/v2';

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

/// The course memberships endpoints...
const Map<String, String> course_memberships = {
  'get_course_memberships': 'courses/{courseId}/users',
  'get_membership': 'courses/{courseId}/users/{userId}',
  'get_user_memberships': 'users/{userId}/courses'
};
