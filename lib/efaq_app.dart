import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/login_view.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/registeration_view.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/home_view.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class EfaqApp extends StatelessWidget {
  const EfaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      child: ToastificationWrapper(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: ColorManager.primary,
          ),
          home: HomeView(),
        ),
      ),
    );
  }
}
