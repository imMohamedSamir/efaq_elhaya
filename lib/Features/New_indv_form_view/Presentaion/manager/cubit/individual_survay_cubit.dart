import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/address.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/employment.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/indiv_form_model.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/survey_source.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/repo/indiv_repo.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'individual_survay_state.dart';

class IndividualSurvayCubit extends Cubit<IndividualSurvayState> {
  IndividualSurvayCubit(this._repo) : super(IndividualSurvayInitial());
  final IndivRepo _repo;
  final formKey = GlobalKey<FormState>();
  final IndivFormModel indivFormModel = IndivFormModel();
  final IndivAddress address = IndivAddress();
  final IndivEmployment employment = IndivEmployment();
  final IndivSurveySource surveySource = IndivSurveySource();
  bool isPassport = false;
  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      indivFormModel.address = address;
      indivFormModel.employment = employment;
      indivFormModel.surveySource = surveySource;
      _handleAgeAtRegisteration();

      _handleNid();
      log(indivFormModel.toJson().toString());
      final result = await _repo.sendForm(form: indivFormModel);
      result.fold(
          (fail) => CustomToastification.errorDialog(
              content: LocaleKeys.indvErrorMsg.tr()), (success) {
        CustomDialog.IndivSuccess();
      });
    } else {
      CustomToastification.errorDialog(
          content: LocaleKeys.genericValidation.tr());
    }
  }

  void _handleNid() {
    if (isPassport) {
      indivFormModel.identity = indivFormModel.nationalId;
      indivFormModel.nationalId = null;
    } else {
      if (indivFormModel.identity != null) {
        indivFormModel.nationalId = indivFormModel.identity;
        indivFormModel.identity = null;
      }
    }
  }

  void _handleAgeAtRegisteration() {
    final DateTime? birthDate = DateTime.tryParse(indivFormModel.birthDate!);
    if (birthDate == null) return;

    final DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // Adjust age if birthday hasn't occurred this year yet
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    indivFormModel.ageAtRegistration = age; // Store calculated age
  }
}
