import 'dart:io';

import 'package:efaq_elhaya/Core/widgets/custom_check_box.dart';
import 'package:efaq_elhaya/Core/widgets/custom_file_picker_widget.dart';
import 'package:flutter/material.dart';

class FamilyDocCard extends StatelessWidget {
  const FamilyDocCard(
      {super.key,
      required this.title,
      required this.onChanged,
      this.initialFile});
  final String title;
  final ValueChanged<File?> onChanged;
  final File? initialFile;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExist = ValueNotifier<bool>(false);
    isExist.value = initialFile != null;
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isExist,
          builder: (BuildContext context, bool value, Widget? child) {
            return Expanded(
                child: CustomFilePickerWidget(
              file: initialFile,
              enabled: value,
              title: title,
              onChanged: (p0) {
                onChanged(p0);
              },
            ));
          },
        ),
        CustomCheckBox(
            value: initialFile != null,
            onChanged: (check) {
              isExist.value = check ?? false;
              if (!isExist.value) {
                onChanged(null);
              }
            }),
      ],
    );
  }
}
