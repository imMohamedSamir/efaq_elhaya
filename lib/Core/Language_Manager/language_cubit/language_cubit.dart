import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/home_view.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar')); // Set default locale to English

  void changeLanguage(Locale newLocale) {
    emit(newLocale);
    navigatorKey.currentContext!.setLocale(newLocale);
    NavigateToPage.slideFromTopAndRemove(
        context: navigatorKey.currentContext!, page: const HomeView());
  }
}
