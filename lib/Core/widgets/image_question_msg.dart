import 'dart:io';

import 'package:efaq_elhaya/Core/Helpers/custom_file_picker.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageQuestionMsg extends StatelessWidget {
  const ImageQuestionMsg({super.key, this.onChanged});
  final void Function(File)? onChanged; // Callback for value selection

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.h,
        children: [
          CustomButton(
            text: "الاستوديو",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () async {
              final file = await CustomFilePicker.gallery();
              if (file != null) {
                onChanged!(file);
                Navigator.pop(context);
              }
            },
          ),
          CustomButton(
            text: "الكاميرا",
            txtcolor: Colors.white,
            btncolor: ColorManager.primary,
            onPressed: () async {
              final file = await CustomFilePicker.camera();
              if (file != null) {
                onChanged!(file);
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
