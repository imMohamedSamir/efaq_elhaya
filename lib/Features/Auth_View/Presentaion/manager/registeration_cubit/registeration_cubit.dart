import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/registration_model.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this._repo) : super(RegisterationInitial());
  final AuthRepo _repo;
  final key = GlobalKey<FormState>();
  final RegistrationModel model = RegistrationModel();
  void registeration() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      model.username = model.email!.split('@')[0];
      log(model.toJson().toString());
      emit(RegisterationLoading());
      final result = await _repo.signUp(model: model);
      result.fold((fail) => emit(RegisterationFailure(fail.errMessage)),
          (success) {
        log(success.toString());
        emit(RegisterationSuccess());
        CustomToastification.successDialog(
            content: LocaleKeys.regisertationSuccess.tr());
        Navigator.pop(navigatorKey.currentContext!);
      });
    }
  }
}
