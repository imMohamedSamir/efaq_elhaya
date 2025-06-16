import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Helpers/location_service.dart';
import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_cubit/family_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/manager/family_location_cubit/family_location_cubit.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/Presentaion/views/new_from_body.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo_impl.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewFamilyFormView extends StatelessWidget {
  const NewFamilyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FamilyCubit(getIt.get<FamilyRepoImpl>()),
        ),
        BlocProvider(
            create: (context) =>
                FamilyLocationCubit(getIt.get<LocationService>())),
      ],
      child: Scaffold(
        appBar: CustomAppbar.normal(context,
            title: LocaleKeys.createFamilyForm.tr()),
        body: const NewFromBody(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
