import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FamilyFormsListHeader extends StatelessWidget {
  const FamilyFormsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(LocaleKeys.familyNumber.tr(),
                style: AppTextStyles.semiBold18
                    .copyWith(color: ColorManager.secondary)),
          ),
          Expanded(
            flex: 7,
            child: Text(LocaleKeys.familyDetails.tr(),
                style: AppTextStyles.semiBold18
                    .copyWith(color: ColorManager.secondary)),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
