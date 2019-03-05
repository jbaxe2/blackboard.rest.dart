library blackboard.rest.endpoints;

/// The base endpoint for all REST API calls...
const String base = '/learn/api/public/v1/';

/// The oauth endpoints...
const Set<String> oauth = {
  'oath2/authorizationcode',
  'oauth2/token'
};

/// The announcements endpoints...
const Set<String> announcements = {
  'announcements',
  'announcements/{announcementId}'
};

/// The courses endpoints...
const Set<String> courses = {
  'courses',
  'courses/{courseId}',
  'courses/{courseId}/children',
  'courses/{courseId}/children/{childCourseId}',
  'courses/{courseId}/copy',
  'courses/{courseId}/crossListSet',
  'courses/{courseId}/tasks/{taskId}'
};

/// The system endpoints...
const Set<String> system = {
  'system/version'
};
