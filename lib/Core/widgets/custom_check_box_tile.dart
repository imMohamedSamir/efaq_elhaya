import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatefulWidget {
  const CustomCheckBoxTile({
    super.key,
    required this.onChanged,
    required this.title,
    this.initialValue, // Callback to notify parent widget
  });
  final String title;
  final Function(bool) onChanged; // Callback function
  final bool? initialValue;

  @override
  State<CustomCheckBoxTile> createState() => _CustomCheckBoxTileState();
}

class _CustomCheckBoxTileState extends State<CustomCheckBoxTile> {
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
