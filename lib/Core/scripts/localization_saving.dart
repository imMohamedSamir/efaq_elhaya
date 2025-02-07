// import 'dart:developer';
// import 'dart:io';
// import 'dart:convert';

// import 'package:watcher/watcher.dart';

// void initializeEasyLocalization() async {
//   String directoryPath = 'assets/translations/ar.json';
//   log("Watching for changes in $directoryPath...");

//   // Ensure the directory exists
//   if (!Directory(directoryPath).existsSync()) {
//     log("❌ Directory $directoryPath does not exist.");
//     return;
//   }

//   DateTime lastModified = Directory(directoryPath).statSync().modified;

//   while (true) {
//     DateTime newModified = Directory(directoryPath).statSync().modified;

//     if (newModified.isAfter(lastModified)) {
//       log("🚀 Changes detected in $directoryPath!");
//       lastModified = newModified;
//       _runEasyLocalizationCommands();
//     }

//     sleep(Duration(seconds: 2)); // Poll every 2 seconds
//   }

//   // Watch the directory for file changes
//   // DirectoryWatcher(directoryPath).events.listen((event) async {
//   //   if (event.type == ChangeType.MODIFY || event.type == ChangeType.ADD) {
//   //     log("File changed: ${event.path}");
//   //     await _runEasyLocalizationCommands();
//   //   }
//   // });
// }

// Future<void> _runEasyLocalizationCommands() async {
//   log("Running Easy Localization commands...");

//   // First command
//   ProcessResult result1 = await Process.run('flutter', [
//     'pub',
//     'run',
//     'easy_localization:generate',
//     '--source-dir',
//     './assets/translations'
//   ]);
//   log(result1.stdout);
//   log(result1.stderr);

//   // Second command
//   ProcessResult result2 = await Process.run('flutter', [
//     'pub',
//     'run',
//     'easy_localization:generate',
//     '--source-dir',
//     './assets/translations',
//     '-f',
//     'keys',
//     '-o',
//     'locale_keys.g.dart'
//   ]);
//   log(result2.stdout);
//   log(result2.stderr);

//   log("Easy Localization commands executed successfully!");
// }
