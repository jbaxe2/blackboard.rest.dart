library blackboard.rest.announcements.announcement;

import 'availability.dart';

/// The [Announcement] class...
class Announcement {
  final String id;

  final String title;

  final String body;

  final Availability availability;

  final bool showAtLogin;

  final bool showInCourses;

  final DateTime created;

  final DateTime modified;

  /// The [Announcement] constructor...
  Announcement (
    this.id, this.title, this.created, this.modified,
    {this.body, this.availability, this.showAtLogin, this.showInCourses}
  );
}
