import 'package:efaq_elhaya/Core/Utlis/service_locator.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/manager/registeration_cubit/registeration_cubit.dart';
import 'package:efaq_elhaya/Features/Auth_View/Presentaion/views/registeration_body.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterationView extends StatelessWidget {
  const RegisterationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterationCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        body: RegisterationBody(),
      ),
    );
  }
}
