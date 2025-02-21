import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTagsTextField extends StatefulWidget {
  const CustomTagsTextField({
    super.key,
    this.hintText,
    required this.onTagsUpdated,
    this.label,
    this.initialValue, // Callback to notify parent widget
  });
  final String? hintText;
  final String? label;
  final List<String>? initialValue;
  final Function(List<String>) onTagsUpdated; // Callback function

  @override
  State<CustomTagsTextField> createState() => _CustomTagsTextFieldState();
}

class _CustomTagsTextFieldState extends State<CustomTagsTextField> {
  final TextEditingController _textController = TextEditingController();
  List<String> _tags = [];
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    _handleInitialValue();
    super.initState();
  }

  void _handleInitialValue() {
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      setState(() {
        _tags = widget.initialValue!;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTag() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _tags.add(_textController.text.trim());
        _textController.clear();
        widget.onTagsUpdated(_tags); // Notify parent widget
        focusNode.requestFocus();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
      widget.onTagsUpdated(_tags); // Notify parent widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField for input
        CustomTextField(
          suffixIcon: const Icon(Icons.more),
          focusNode: focusNode,
          hintText: widget.hintText,
          label: widget.label,
          controller: _textController,
          onFieldSubmitted: (value) => _addTag(),
          textInputAction: TextInputAction.done,
          onSaved: (p0) {
            widget.onTagsUpdated(_tags);
          },
        ),
        const SizedBox(height: 10),
        // Display tags dynamically
        Wrap(
          spacing: 6.0.w,
          runSpacing: 4.0.h,
          children: _tags.map((tag) {
            return Chip(
              color: WidgetStateProperty.all(
                  ColorManager.primary.withValues(alpha: .2)),
              label: Text(
                tag,
                style: AppTextStyles.semiBold16
                    .copyWith(color: ColorManager.secondary),
              ),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
