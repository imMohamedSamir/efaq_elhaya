import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/share_service.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/ind_success_btn.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_Success_icon.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IndvSuccessSec extends StatelessWidget {
  const IndvSuccessSec({super.key, this.pdf});
  final File? pdf;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          gradient: LinearGradient(
              tileMode: TileMode.decal,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.primary.withValues(alpha: .0),
                ColorManager.primary.withValues(alpha: .5)
              ])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(LocaleKeys.indvSuccessMsg.tr(),
              style: AppTextStyles.semiBold18.copyWith(fontSize: 20)),
          Gap(16.h),
          const IndvSuccessIcon(),
          Gap(40.h),
          // IndvSuccessBtn(
          //   title: LocaleKeys.shareForm.tr(),
          //   icon: Icons.share_rounded,
          //   onTap: () async {
          //     ShareService.share("text");
          //   },
          // ),
          // Gap(16.h),
          IndvSuccessBtn(
            title: LocaleKeys.sharePdf.tr(),
            icon: Icons.picture_as_pdf_rounded,
            onTap: () {
              ShareService.shareFile(file: pdf!);
            },
          ),
        ],
      ),
    );
  }
}
