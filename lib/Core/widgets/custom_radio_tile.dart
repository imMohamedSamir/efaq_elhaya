import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile(
      {super.key,
      this.value,
      this.groupValue,
      this.onChanged,
      required this.title});
  final value;
  final groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: groupValue == value
            ? ColorManager.primary.withValues(alpha: .2)
            : null,
        activeColor: ColorManager.primary,
        title: Text(title, style: AppTextStyles.medium18),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
