import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo_impl.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/repo/indiv_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<IndivRepoImpl>(
      IndivRepoImpl(apiServices: getIt.get<ApiServices>()));
}
