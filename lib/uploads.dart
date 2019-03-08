library blackboard.rest.uploads;

import 'dart:io' show FileSystemEntity;

import 'src/uploads/uploaded_file_info.dart';

/// The [Uploads] abstract class...
abstract class Uploads {
  /// The [upload] abstract method...
  Future<UploadedFileInfo> upload (FileSystemEntity fileEntity);
}
