library blackboard.rest.announcements;

import 'dart:async' show Future;

import 'src/announcements/announcement.dart';

/// The [Announcements] abstract class...
abstract class Announcements {
  /// The [getAnnouncements] abstract method...
  Future<Iterable<Announcement>> getAnnouncements();

  /// The [createAnnouncement] abstract method...
  Future<void> createAnnouncement (Announcement announcement);

  /// The [getAnnouncement] abstract method...
  Future<Announcement> getAnnouncement (String announcementId);

  /// The [updateAnnouncement] abstract method...
  Future<void> updateAnnouncement (
    String announcementId, Announcement announcement
  );
}
