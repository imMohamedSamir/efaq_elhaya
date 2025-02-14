import 'package:efaq_elhaya/Core/Language_Manager/language_cubit/language_cubit.dart';
import 'package:efaq_elhaya/Features/Profile_View/Presentaion/views/LanguageRadioLT.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangaugeSec extends StatefulWidget {
  const LangaugeSec({
    super.key,
  });

  @override
  State<LangaugeSec> createState() => _LangaugeSecState();
}

class _LangaugeSecState extends State<LangaugeSec> {
  String? groupValue;
  @override
  void initState() {
    // TODO: implement initState
    final locale = context.read<LanguageCubit>().state;
    groupValue = locale.languageCode == 'en' ? 'English' : 'Arabic';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageRadioLT(
          title: "English (US)",
          groupValue: groupValue,
          value: 'English',
          onChanged: (String? value) {
            setState(() {
              groupValue = value;

              BlocProvider.of<LanguageCubit>(context)
                  .changeLanguage(const Locale('en'));
            });
          },
        ),
        BlocBuilder<LanguageCubit, Locale>(
          builder: (context, state) {
            return LanguageRadioLT(
              groupValue: groupValue,
              value: "Arabic",
              onChanged: (String? value) {
                setState(() {
                  groupValue = value;
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(const Locale('ar'));
                });
              },
              title: state.languageCode == 'en' ? 'Arabic' : 'العربية',
            );
          },
        )
      ],
    );
  }
}
