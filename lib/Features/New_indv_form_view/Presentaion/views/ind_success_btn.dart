import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndvSuccessBtn extends StatelessWidget {
  const IndvSuccessBtn({super.key, required this.title, this.onTap, this.icon});
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: 360.w,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [Color(0xff00A5CF), Color(0xff005469)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.w,
          children: [
            Text(
              title,
              style: AppTextStyles.medium16.copyWith(color: Colors.white),
            ),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
