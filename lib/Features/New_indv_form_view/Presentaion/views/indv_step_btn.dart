import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IndvStepBtn extends StatelessWidget {
  const IndvStepBtn(
      {super.key,
      required this.currentPage,
      required this.onNextTapped,
      required this.onBackTapped});

  final int currentPage;
  final dynamic Function() onNextTapped;
  final dynamic Function() onBackTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              btncolor: ColorManager.grey,
              text: LocaleKeys.back.tr(),
              txtcolor: Colors.white,
              onPressed: () {
                if (currentPage > 0) {
                  onBackTapped();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          Gap(16.w),
          Expanded(
            child: CustomButton(
              btncolor: ColorManager.primary,
              text: LocaleKeys.Next.tr(),
              txtcolor: Colors.white,
              onPressed: onNextTapped,
            ),
          ),
        ],
      ),
    );
  }
}
