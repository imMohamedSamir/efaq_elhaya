import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/family_nid_sec.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDetails extends StatelessWidget {
  const FamilyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FamilyCubit>(context);
    return Column(
      spacing: 16.h,
      children: [
        CustomTextField(
          alwaysValidate: true,
          initialValue: cubit.newFamilyModel.familyNumber,
          hintText: LocaleKeys.familyNumberHint.tr(),
          label: LocaleKeys.familyNumber.tr(),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: Validation.general,
          onChanged: (p0) {
            cubit.newFamilyModel.familyNumber = p0.trim();
          },
        ),
        CustomTextField(
          alwaysValidate: true,
          initialValue: cubit.newFamilyModel.familyName,
          hintText: LocaleKeys.familyNameHint.tr(),
          label: LocaleKeys.familyName.tr(),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: Validation.general,
          onChanged: (p0) {
            cubit.newFamilyModel.familyName = p0.trim();
          },
        ),
        const FamilyNidSec(),
        const Divider(thickness: 2),
        // CustomButton(
        //   text: "getpdf",
        //   txtcolor: Colors.white,
        //   btncolor: Colors.green,
        //   onPressed: () {
        //     CustomDialog.SuccessForm();
        //   },
        // )
        // const FamilyHeadSec()
      ],
    );
  }
}
