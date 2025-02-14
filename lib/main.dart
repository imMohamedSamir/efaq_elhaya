import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Core/Utlis/blocObs.dart';
import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/efaq_app.dart';
import 'package:efaq_elhaya/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();

  runApp(
    EasyLocalization(
        startLocale: const Locale(kArabic),
        assetLoader: const CodegenLoader(),
        supportedLocales: const [Locale(kArabic), Locale(kEnglish)],
        path: kTranslationPath,
        fallbackLocale: const Locale(kArabic),
        child: const EfaqApp()),
  );
}
