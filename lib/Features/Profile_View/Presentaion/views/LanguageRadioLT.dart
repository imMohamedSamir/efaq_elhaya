import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class LanguageRadioLT extends StatelessWidget {
  const LanguageRadioLT({
    super.key,
    required this.groupValue,
    this.onChanged,
    required this.value,
    this.title,
  });
  final String? groupValue, value, title;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: ColorManager.primary,
      value: value!,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title!,
        style: AppTextStyles.medium18.copyWith(color: const Color(0xff5A5A5A)),
      ),
    );
  }
}
