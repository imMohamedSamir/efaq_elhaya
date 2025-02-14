import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.getLabel, // Function to get label from object
    this.onChanged,
    required this.getValue,
    this.initialSelection,
  });

  final String hint;
  final List<T> items; // Generic list of objects
  final String Function(T) getLabel; // Function to extract label
  final dynamic Function(T) getValue; // Function to extract label
  final void Function(dynamic)? onChanged; // Callback for value selection
  final dynamic initialSelection;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: initialSelection,
      enableFilter: true,
      focusNode: FocusNode(),
      controller: TextEditingController(),
      textStyle:
          AppTextStyles.semiBold16.copyWith(color: ColorManager.secondary),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      menuStyle: MenuStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))))),
      hintText: hint,
      width: double.infinity,
      // menuHeight: 300.h,
      onSelected: onChanged,
      dropdownMenuEntries: items
          .map((item) => DropdownMenuEntry(
              label: getLabel(item),
              value: getValue(item),
              labelWidget: Text(
                getLabel(item),
                style: AppTextStyles.medium16
                    .copyWith(color: ColorManager.secondary),
              )))
          .toList(),
    );
  }
}
