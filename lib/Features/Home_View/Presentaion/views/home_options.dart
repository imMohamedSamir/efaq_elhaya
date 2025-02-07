import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/home_option_model.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});
  static List<HomeOptionModel> options = [
    HomeOptionModel(
        title: LocaleKeys.createFamilyForm.tr(),
        icon: Icons.post_add_rounded,
        route: SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.pendingForms.tr(),
        icon: Icons.pending_actions_rounded,
        route: SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.phoneForm.tr(), icon: Icons.phone, route: SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.shareFamilyForm.tr(),
        icon: Icons.share,
        route: SizedBox()),
    HomeOptionModel(
        title: LocaleKeys.SubmitStoredForm.tr(),
        icon: Icons.send_rounded,
        route: SizedBox()),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          children: List.generate(options.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0.h),
          child: ListTile(
            contentPadding: EdgeInsets.only(right: 70.w, left: 16.w),
            tileColor: ColorManager.primary,
            iconColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: ColorManager.primary)),
            titleAlignment: ListTileTitleAlignment.center,
            trailing: Icon(options[index].icon, size: 30.sp),
            title: Text(
              options[index].title,
              style: AppTextStyles.medium18.copyWith(color: Colors.white),
            ),
            onTap: () {
              NavigateToPage.slideFromLeft(
                  context: context, page: options[index].route);
            },
          ),
        );
      })),
    );
  }
}
