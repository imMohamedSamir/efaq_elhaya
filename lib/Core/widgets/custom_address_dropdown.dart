import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressDropdown<T> extends StatelessWidget {
  const CustomAddressDropdown(
      {super.key,
      required this.hint,
      required this.items,
      required this.getLabel,
      required this.getValue,
      this.onSelected});
  final String hint;
  final List<T> items;
  final String Function(T) getLabel; // Function to extract label
  final dynamic Function(T) getValue; // Function to extract label
  final void Function(dynamic)? onSelected;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enableFilter: true,
      focusNode: FocusNode(),
      controller: TextEditingController(),
      textStyle: AppTextStyles.semiBold16,
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
      menuHeight: 200.h,
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
      onSelected: onSelected,
    );
  }
}
