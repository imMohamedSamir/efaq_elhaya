import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';

void precachAssetsMethod() {
  precacheImage(
      const AssetImage(Assets.imagesIndivHome), navigatorKey.currentContext!);
  precacheImage(
      const AssetImage(Assets.imagesLoginImg), navigatorKey.currentContext!);
}
