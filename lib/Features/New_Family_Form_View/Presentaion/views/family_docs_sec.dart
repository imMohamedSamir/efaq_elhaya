import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_check_box_tile.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDocsSec extends StatelessWidget {
  const FamilyDocsSec({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> hasgas = ValueNotifier<bool>(false);
    final ValueNotifier<bool> haswater = ValueNotifier<bool>(false);
    return Column(
      spacing: 16.h,
      children: [
        CustomCheckBoxTile(
            onChanged: (p0) {
              hasgas.value = p0;
            },
            title: LocaleKeys.gasInvoice.tr()),
        ValueListenableBuilder(
          valueListenable: hasgas,
          builder: (BuildContext context, bool value, Widget? child) {
            return CustomTextField(
              enabled: value,
              hintText: LocaleKeys.imageUrl.tr(),
              label: LocaleKeys.imageUrl.tr(),
              textInputAction: TextInputAction.next,
            );
          },
        ),
        CustomCheckBoxTile(
            onChanged: (p0) {
              haswater.value = p0;
            },
            title: LocaleKeys.waterInvoice.tr()),
        ValueListenableBuilder(
          valueListenable: haswater,
          builder: (BuildContext context, bool value, Widget? child) {
            return CustomTextField(
              enabled: value,
              hintText: LocaleKeys.imageUrl.tr(),
              label: LocaleKeys.imageUrl.tr(),
              textInputAction: TextInputAction.next,
            );
          },
        ),
      ],
    );
  }
}
