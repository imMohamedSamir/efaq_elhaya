import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/manager/cubit/individual_survay_cubit.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/indv_bottom_bar.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/Presentaion/views/new_indv_body.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/repo/indiv_repo_impl.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIndvFormView extends StatelessWidget {
  const NewIndvFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndividualSurvayCubit(getIt.get<IndivRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppbar.normal(context,
            title: LocaleKeys.createIndividualForm.tr()),
        body: const NewIndvBody(),
        bottomNavigationBar: const IndvBottomBar(),
      ),
    );
  }
}
