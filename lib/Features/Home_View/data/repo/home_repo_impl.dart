import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, AppMetaData>> getMetaData() async {
    try {
      const endPoint = "MetaData";
      final response = await apiServices.get(endPoint: endPoint);
      final metaData = AppMetaData.fromJson(response);
      // log(metaData.toJson().toString());
      return Right(metaData);
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        log(e.response.toString());

        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getProflie() async {
    try {
      const endPoint = "Profile/UserProfile";
      final token = await TokenManager.getUserToken();
      final response = await apiServices.get(endPoint: endPoint, token: token);
      final profile = UserProfile.fromJson(response['userProfile']);
      // log(metaData.toJson().toString());
      return Right(profile);
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        log(e.response.toString());

        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
