import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/location_service.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationMsgWidget extends StatelessWidget {
  const LocationMsgWidget({super.key, this.isService = false});
  final bool isService;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(36)),
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(LocaleKeys.enableLocation.tr(), style: AppTextStyles.medium18),
          Text(LocaleKeys.enableLocationMsg.tr(),
              style: AppTextStyles.medium16),
          CustomButton(
            text: LocaleKeys.enableLocationBtn.tr(),
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () {
              LocationService().enableLocation();
            },
          ),
          CustomButton(
            text: LocaleKeys.cancel.tr(),
            withBorder: true,
            txtcolor: Colors.red,
            btncolor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
