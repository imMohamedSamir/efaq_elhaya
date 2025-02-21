import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class CustomFilePicker {
  static Future<File?> single({FileType type = FileType.any}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: type);

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
    }
    return null;
  }

  static Future<List<File>?> multiple(
      {List<String>? extintions, FileType type = FileType.any}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, allowedExtensions: extintions, type: type);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
    }
    return null;
  }
}
