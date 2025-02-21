import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_card_model.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard({
    super.key,
    required this.card,
  });
  final ProfileOptionsCardModel card;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: () {
        NavigateToPage.slideFromLeft(context: context, page: card.page);
      },
      leading: Icon(card.icon, size: 30),
      title: Row(
        children: [
          Text(
            card.title,
            style:
                AppTextStyles.bold18.copyWith(color: const Color(0xff240301)),
          ),
          const Spacer(),
          if (LocaleKeys.Language.tr() == card.title)
            Text(
              _getLang(context),
              style:
                  AppTextStyles.bold18.copyWith(color: const Color(0xff240301)),
            ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  String _getLang(BuildContext context) {
    log(context.locale.languageCode);
    return context.locale.languageCode == 'en' ? "English" : "العربية";
  }
}
