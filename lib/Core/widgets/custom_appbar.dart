import 'package:efaq_elhaya/Core/Utlis/AppAssets.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar {
  static AppBar normal(BuildContext context,
      {required String title, Widget? action}) {
    return AppBar(
      title: Text(title,
          style:
              AppTextStyles.medium24.copyWith(color: ColorManager.secondary)),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded)),
    );
  }

  static AppBar Home(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        Assets.imagesAfaqElhaya,
        height: 50.h,
        width: 50.w,
      ),
      centerTitle: true,
    );
  }

  static AppBar main(BuildContext context, {required String title}) {
    return AppBar(
      title: Text(title,
          style:
              AppTextStyles.medium24.copyWith(color: ColorManager.secondary)),
    );
  }
}
