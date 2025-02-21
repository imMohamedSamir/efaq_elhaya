import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Core/Utlis/precach_assets.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/login_view.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/home_view.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class EfaqApp extends StatelessWidget {
  const EfaqApp({super.key});

  /// ✅ **Check if Token is Expired**
  Future<bool> _isTokenValid() async {
    final bool isExpired = await TokenManager.tokenIsExp();
    return !isExpired;
  }

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
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            primaryColor: ColorManager.primary,
          ),
          home: FutureBuilder<bool>(
            future: _isTokenValid(),
            builder: (context, snapshot) {
              precachAssetsMethod();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasData && snapshot.data == true) {
                return const HomeView();
              } else {
                return const HomeView();
              }
            },
          ),
        ),
      ),
    );
  }
}
