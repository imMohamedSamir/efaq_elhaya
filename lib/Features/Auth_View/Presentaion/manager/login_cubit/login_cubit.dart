import 'package:bloc/bloc.dart';
import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Core/routing/NavigationMethod.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/login_model.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo.dart';
import 'package:efaq_elhaya/Features/Home_View/Presentaion/home_view.dart';
import 'package:efaq_elhaya/main.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());
  final AuthRepo _repo;
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(LoginLoading());
      final result = await _repo.signIn(email: email, password: password);
      result.fold((fail) => emit(LoginFailure(fail.errMessage)), (model) {
        emit(LoginSuccess());
        _saveToken(model);
        CustomToastification.successDialog(content: "تم تسجيل الدخول بنجاح");
        NavigateToPage.slideFromRightandRemove(
            context: navigatorKey.currentContext!, page: HomeView());
      });
    }
  }

  void _saveToken(LoginModel success) {
    TokenManager.saveUserToken(userDetails: success);
  }
}
