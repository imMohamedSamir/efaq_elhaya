import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/families_cubit/families_cubit.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_forms_body.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/repo/families_repo_impl.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FamilyFormsView extends StatelessWidget {
  const FamilyFormsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamiliesCubit(getIt.get<FamiliesRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppbar.normal(context, title: LocaleKeys.phoneForm.tr()),
        body: const FamilyFormsBody(),
      ),
    );
  }
}
