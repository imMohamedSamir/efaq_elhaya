import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Helpers/location_service.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo_impl.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo_impl.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/repo/indiv_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<IndivRepoImpl>(
      IndivRepoImpl(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiServices: getIt.get<ApiServices>()));
  getIt.registerSingleton<LocationService>(LocationService());
}
