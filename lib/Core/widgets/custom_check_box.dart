import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChanged,
    required this.title,
    this.initialValue, // Callback to notify parent widget
  });
  final String title;
  final Function(bool) onChanged; // Callback function
  final bool? initialValue;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;
  @override
  void initState() {
    _setInitailaValue();
    super.initState();
  }

  void _setInitailaValue() {
    if (widget.initialValue != null) {
      setState(() {
        _isChecked = widget.initialValue!;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title,
          style:
              AppTextStyles.semiBold18.copyWith(color: ColorManager.secondary)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: ColorManager.grey)),
      contentPadding: const EdgeInsets.only(right: 8),
      checkColor: Colors.white,
      activeColor: ColorManager.primary,
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(_isChecked); // Notify parent widget
      },
    );
  }
}
