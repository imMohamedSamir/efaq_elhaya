import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/home_option_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeOptionCard extends StatelessWidget {
  const HomeOptionCard({
    super.key,
    required this.option,
  });
  final HomeOptionModel option;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        tileColor: option.isActive
            ? ColorManager.primary
            : ColorManager.grey.withValues(alpha: .5),
        iconColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: ColorManager.primary)),
        titleAlignment: ListTileTitleAlignment.center,
        trailing: Icon(option.icon, size: 30.sp),
        title: Text(
          option.title,
          style: AppTextStyles.medium18.copyWith(color: Colors.white),
        ),
        onTap: option.isActive
            ? () {
                NavigateToPage.slideFromLeft(
                    context: context, page: option.route);
              }
            : null,
      ),
    );
  }
}
