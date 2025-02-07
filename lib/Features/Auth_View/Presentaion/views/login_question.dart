import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/login_view.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginQuestion extends StatelessWidget {
  const LoginQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          NavigateToPage.slideFromRightandRemove(
              context: context, page: LoginView());
        },
        borderRadius: BorderRadius.circular(16),
        child: Text(LocaleKeys.already_have_account.tr(),
            style:
                AppTextStyles.medium16.copyWith(color: ColorManager.primary)),
      ),
    );
  }
}
