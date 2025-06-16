import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/image_question_msg.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilePickerWidget extends StatelessWidget {
  const CustomFilePickerWidget({
    super.key,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.file,
  });

  final void Function(File?)? onChanged; // Now allows null for deletion
  final bool enabled;

  final String? title;
  final File? file;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final ValueNotifier<File?> image = ValueNotifier<File?>(null);

    return Column(
      children: [
        CustomTextField(
          controller: controller,
          enabled: enabled,
          readOnly: true,
          hintText: title ?? LocaleKeys.image.tr(),
          label: title ?? LocaleKeys.image.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // File picker button
              IconButton(
                onPressed: () => _showImgQ(context, onChanged: (file) {
                  controller.text = "تم حفظ الصورة";
                  image.value = file;
                  if (onChanged != null) onChanged!(file);
                }),
                icon: const Icon(Icons.file_present_rounded),
              ),
              // Delete image button
              ValueListenableBuilder<File?>(
                valueListenable: image,
                builder: (context, value, _) {
                  if (value != null) {
                    return IconButton(
                      onPressed: () {
                        controller.clear();
                        image.value = null;
                        onChanged!(null);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        // AspectRatio(
        //   aspectRatio: 3.5,
        //   child: Image.asset(
        //     Assets.imagesLoginImg,
        //     fit: BoxFit.contain,
        //   ),
        // ),

        // Display selected image
        if (file != null)
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: AspectRatio(
              aspectRatio: 3.5,
              child: Image.file(file!, fit: BoxFit.contain),
            ),
          )
        else
          ValueListenableBuilder<File?>(
            valueListenable: image,
            builder: (context, value, _) {
              if (value != null) {
                return Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: AspectRatio(
                    aspectRatio: 3.5,
                    child: Image.file(value, fit: BoxFit.contain),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
      ],
    );
  }

  void _showImgQ(BuildContext context, {required Function(File) onChanged}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ImageQuestionMsg(onChanged: onChanged),
    );
  }
}
