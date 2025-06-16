import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterCard extends StatelessWidget {
  const HelpCenterCard({
    super.key,
    required this.title,
    required this.child,
    this.onTap,
  });
  final String title;
  final Widget child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: Card(
        color: Colors.white,
        elevation: 0.6,
        child: ListTile(
          onTap: onTap,
          leading: child,
          title: Text(title,
              textDirection: TextDirection.ltr,
              style:
                  AppTextStyles.bold18.copyWith(color: ColorManager.secondary)),
        ),
      ),
    );
  }
}
