import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/login_cubit/login_cubit.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBtnBuilder extends StatelessWidget {
  const LoginBtnBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        }
        return CustomButton(
          text: LocaleKeys.SignIn.tr(),
          txtcolor: Colors.white,
          btncolor: ColorManager.primary,
          onPressed: () {
            BlocProvider.of<LoginCubit>(context).login();
          },
        );
      },
    );
  }
}
