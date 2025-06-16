import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/login_cubit/login_cubit.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/login_view_body.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
