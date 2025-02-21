import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.getLabel, // Function to get label from object
    required this.getValue,
    this.onChanged,
    this.initialSelection,
    this.isRequired = false,
    this.isSearch = false,
  });

  final String hint;
  final List<T> items; // Generic list of objects
  final String Function(T) getLabel; // Function to extract label
  final dynamic Function(T) getValue; // Function to extract value
  final void Function(dynamic)? onChanged; // Callback for value selection
  final dynamic initialSelection;
  final bool isRequired;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: initialSelection,
      validator: isRequired ? Validation.general : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<dynamic> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu(
              initialSelection: initialSelection,
              enableFilter: true,
              focusNode: isSearch ? FocusNode() : null,
              controller: TextEditingController(text: field.value),
              textStyle: AppTextStyles.semiBold18.copyWith(
                color: ColorManager.secondary,
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: field.hasError ? Colors.red : ColorManager.primary,
                  ),
                ),
              ),
              menuStyle: MenuStyle(
                shape: WidgetStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
              ),
              hintText: hint,
              width: double.infinity,
              menuHeight: 250.h,
              onSelected: (value) {
                field.didChange(value);
                if (onChanged != null) onChanged!(value);
              },
              dropdownMenuEntries: items
                  .map(
                    (item) => DropdownMenuEntry(
                      label: getLabel(item),
                      value: getValue(item),
                      labelWidget: Text(
                        getLabel(item),
                        style: AppTextStyles.medium18.copyWith(
                          color: ColorManager.secondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            if (field.hasError) // Show validation error
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  field.errorText ?? '',
                  style: AppTextStyles.medium16.copyWith(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
