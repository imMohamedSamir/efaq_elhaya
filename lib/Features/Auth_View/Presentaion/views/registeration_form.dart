import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/validation.dart';
import 'package:efaq_elhaya/Core/widgets/CustomPasswordField.dart';
import 'package:efaq_elhaya/Core/widgets/CustomTextField.dart';
import 'package:efaq_elhaya/Core/widgets/custom_gender_dropdwon.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/registeration_cubit/registeration_cubit.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/registeration_btn_builder.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterationForm extends StatelessWidget {
  const RegisterationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RegisterationCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hintText: LocaleKeys.FirstName.tr(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validation.firstName,
            onSaved: (p0) {
              cubit.model.firstName = p0!.trim();
            },
          ),
          Gap(20.h),
          CustomTextField(
            hintText: LocaleKeys.LastName.tr(),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validation.lastName,
            onSaved: (p0) {
              cubit.model.lastName = p0!.trim();
            },
          ),
          Gap(20.h),
          CustomTextField(
            hintText: LocaleKeys.Email.tr(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: Validation.email,
            onSaved: (p0) {
              cubit.model.email = p0!.trim();
            },
          ),
          Gap(20.h),
          CustomPasswordField(
            isSignUp: true,
            onSaved: (p0) {
              cubit.model.password = p0!.trim();
            },
          ),
          Gap(20.h),
          CustomTextField(
            hintText: LocaleKeys.PhoneNumber.tr(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: Validation.phoneNumber,
            onSaved: (p0) {
              cubit.model.phoneNumber = p0!.trim();
            },
          ),
          Gap(20.h),
          CustomGenderDropdwon(
            onSaved: (p0) {
              cubit.model.gender = p0!;
            },
          ),
          Gap(24.h),
          const RegisterationBtnBuilder()
        ],
      ),
    );
  }
}
