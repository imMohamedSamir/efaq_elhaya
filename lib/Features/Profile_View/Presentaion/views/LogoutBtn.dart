import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        CustomDialog.logoutMsg();
      },
      leading: const Icon(Icons.logout_rounded, color: Colors.red, size: 30),
      title: Text(LocaleKeys.Logout.tr(),
          style: AppTextStyles.bold18.copyWith(color: Colors.red)),
    );
  }
}
