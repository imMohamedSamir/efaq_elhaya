import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FamilyFormDelete extends StatelessWidget {
  const FamilyFormDelete({super.key, this.onDelete});
  final Future<void> Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(LocaleKeys.FamilyDeleteMsg.tr(),
              style: AppTextStyles.semiBold16),
          const Gap(16),
          // Text(
          //   LocaleKeys.FamilyDeleteMsgDesc.tr(),
          //   style: AppTextStyles.regular14.copyWith(color: Colors.grey),
          //   textAlign: TextAlign.center,
          // ),
          Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: LocaleKeys.cancel.tr(),
                btncolor: Colors.white,
                txtcolor: Colors.black,
                withBorder: false,
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
              Gap(8.w),
              Expanded(
                  child: CustomButton(
                text: LocaleKeys.delete.tr(),
                btncolor: Colors.red,
                txtcolor: Colors.white,
                withBorder: false,
                onPressed: () async {
                  if (onDelete != null) await onDelete!();
                },
              )),
            ],
          )
        ],
      ),
    );
  }
}
