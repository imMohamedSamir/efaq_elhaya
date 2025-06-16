import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

abstract class ShareService {
  static void share(String text) async {
    final result = await Share.share(text);
    log(result.status.toString());
    // Share text
  }

  static Future<bool> shareFile({required File file}) async {
    final xfile = XFile(file.path);
    final result = await Share.shareXFiles([xfile]);

    if (result.status == ShareResultStatus.success) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> shareFileFromUrl({String? filename}) async {
    try {
      final response = await Dio().get(
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
          options: Options(responseType: ResponseType.bytes));
      final bytes = response.data;

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${filename ?? 'shared_file.pdf'}');

      await file.writeAsBytes(bytes);
      final xfile = XFile(file.path);
      final result = await Share.shareXFiles([xfile]);
      return result.status == ShareResultStatus.success;
    } catch (e) {
      log('Error sharing file: $e');
      return false;
    }
  }
}
