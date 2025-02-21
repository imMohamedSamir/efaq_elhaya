import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/custom_file_picker.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomFilePickerWidget extends StatelessWidget {
  const CustomFilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomTextField(
      controller: controller,
      hintText: LocaleKeys.imageUrl.tr(),
      label: LocaleKeys.imageUrl.tr(),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      suffixIcon: IconButton(
          onPressed: () async {
            final files = await CustomFilePicker.multiple();
            if (files?.isNotEmpty ?? false) {
              controller.text = "تم حفظ الصور";
            }
          },
          icon: const Icon(Icons.file_present_rounded)),
    );
  }
}
