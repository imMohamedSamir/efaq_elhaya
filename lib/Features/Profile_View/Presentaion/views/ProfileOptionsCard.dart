import 'package:efaq_elhaya/Core/Language_Manager/language_cubit/language_cubit.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Core/theming/text_styles.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      leading: Icon(
        card.icon,
        size: 30,
      ),
      title: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          String lan = state.languageCode == 'en' ? 'English' : 'العربية';
          if (card.title == "Language" || card.title == "اللغة") {
            return Row(
              children: [
                Text(
                  card.title,
                  style: AppTextStyles.bold16
                      .copyWith(color: const Color(0xff240301)),
                ),
                const Spacer(),
                Text(
                  lan,
                  style: AppTextStyles.bold16
                      .copyWith(color: const Color(0xff240301)),
                ),
              ],
            );
          } else {
            return Text(
              card.title,
              style:
                  AppTextStyles.bold18.copyWith(color: const Color(0xff240301)),
            );
          }
        },
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
