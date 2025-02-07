import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/registeration_cubit/registeration_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterationBtnBuilder extends StatelessWidget {
  const RegisterationBtnBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterationCubit, RegisterationState>(
      builder: (context, state) {
        if (state is RegisterationLoading) {
          return Center(
              child: CircularProgressIndicator(color: ColorManager.primary));
        }
        return CustomButton(
          text: LocaleKeys.CreateAccountHint.tr(),
          txtcolor: Colors.white,
          btncolor: ColorManager.primary,
          onPressed: () {
            BlocProvider.of<RegisterationCubit>(context).registeration();
          },
        );
      },
    );
  }
}
