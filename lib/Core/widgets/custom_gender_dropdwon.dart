import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenderDropdwon extends StatelessWidget {
  const CustomGenderDropdwon({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(8),
        hint: Text(LocaleKeys.gender.tr(), style: AppTextStyles.medium16),
        validator: Validation.gender,
        onSaved: onSaved,
        onTap: () {},
        menuMaxHeight: 200.h,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorManager.primary)),
        ),
        onChanged: (value) {},
        items: [
          customDropdownItem(value: LocaleKeys.Male.tr()),
          customDropdownItem(value: LocaleKeys.Female.tr())
        ]);
  }

  DropdownMenuItem<String> customDropdownItem({required String value}) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value, style: AppTextStyles.medium18),
    );
  }
}
