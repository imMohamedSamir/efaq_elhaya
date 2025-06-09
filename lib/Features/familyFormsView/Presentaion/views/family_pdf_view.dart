import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Core/widgets/custom_appbar.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo_impl.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/manager/family_pdf_cubit/family_pdf_cubit.dart';
import 'package:efaq_elhaya/Features/familyFormsView/Presentaion/views/family_pdf_body.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/family_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FamilyPdfView extends StatelessWidget {
  const FamilyPdfView({super.key, required this.familyModel});
  final FamilyModel familyModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamilyPdfCubit(getIt.get<FamilyRepoImpl>())
        ..getPdf(id: familyModel.id ?? ""),
      child: Scaffold(
        appBar:
            CustomAppbar.normal(context, title: familyModel.familyName ?? ""),
        body: const FamilyPdfBody(),
      ),
    );
  }
}
