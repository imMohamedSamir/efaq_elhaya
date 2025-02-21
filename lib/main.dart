import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/Utlis/HiveAdapters.dart';
import 'package:efaq_elhaya/Core/Utlis/blocObs.dart';
import 'package:efaq_elhaya/Core/Utlis/initHive.dart';
import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/efaq_app.dart';
import 'package:efaq_elhaya/generated/codegen_loader.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  await callHiveAdapters();
  await openHiveBox();

  runApp(
    EasyLocalization(
        useOnlyLangCode: true,
        saveLocale: true,
        // startLocale: const Locale(kArabic),
        assetLoader: const CodegenLoader(),
        supportedLocales: const [Locale(kArabic), Locale(kEnglish)],
        path: kTranslationPath,
        fallbackLocale: const Locale(kArabic),
        child: DevicePreview(
          enabled: kReleaseMode,
          builder: (context) => const EfaqApp(),
        )),
  );
}
