import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.onChanged, this.value = false});
  final Function(bool?) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isCheck = ValueNotifier<bool>(false);
    isCheck.value = value;
    return ValueListenableBuilder(
      valueListenable: isCheck,
      builder: (BuildContext context, bool value, Widget? child) {
        return Checkbox(
            checkColor: Colors.white,
            activeColor: ColorManager.primary,
            value: value,
            onChanged: (check) {
              isCheck.value = check ?? false;
              onChanged(isCheck.value);
            });
      },
    );
  }
}
