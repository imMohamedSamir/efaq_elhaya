import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/color_manager.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Core/widgets/customButton.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/login_view.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LogoutMsg extends StatelessWidget {
  const LogoutMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Column(
        spacing: 16.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(LocaleKeys.Logout.tr(),
              style: AppTextStyles.semiBold18
                  .copyWith(color: ColorManager.secondary)),
          Text(LocaleKeys.Logoutofyouraccount.tr(),
              style: AppTextStyles.medium16),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  isborder: true,
                  text: LocaleKeys.Logout.tr(),
                  txtcolor: Colors.white,
                  btncolor: Colors.redAccent,
                  onPressed: () {
                    _logoutMethod(context);
                  },
                ),
              ),
              const Gap(8),
              Expanded(
                child: CustomButton(
                  // isborder: true,
                  text: LocaleKeys.back.tr(),
                  txtcolor: Colors.blueGrey,
                  btncolor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _logoutMethod(BuildContext context) async {
    await TokenManager.removeToken().then((_) {
      NavigateToPage.slideFromTopAndRemove(
          context: context, page: const LoginView());
    });
  }
}
