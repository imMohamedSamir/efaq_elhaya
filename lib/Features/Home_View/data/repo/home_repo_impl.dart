import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/repo/home_repo.dart';

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
}
