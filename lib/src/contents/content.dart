library blackboard.rest.contents.content;

import 'content_availability.dart';
import 'content_handler.dart';

/// The [Content] class...
class Content {
  final String id;

  final String parentId;

  final String title;

  final String body;

  final String description;

  final DateTime created;

  final int position;

  final bool hasChildren;

  final bool hasGradebookColumns;

  final bool hasAssociatedGroups;

  final ContentAvailability availability;

  final ContentHandler contentHandler;

  /// The [Content] constructor...
  Content (
    this.id, this.title, this.created, this.hasChildren, this.hasGradebookColumns,
    this.hasAssociatedGroups,
    {this.parentId, this.body, this.description, this.position, this.availability,
     this.contentHandler}
  );
}
