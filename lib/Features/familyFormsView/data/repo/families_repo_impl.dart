import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/FamilyResponse.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/repo/families_repo.dart';

class FamiliesRepoImpl implements FamiliesRepo {
  final ApiServices _apiServices;

  FamiliesRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, FamilyResponse>> getFamiliesData(
      {int page = 1,
      int pageSize = 10,
      String? familyNumber = "",
      String? familyName = "",
      String? familyPhone = "",
      String? familyAddress = "",
      String? nid = ""}) async {
    final endPoint =
        "FamilySurvey?page=$page&pageSize=$pageSize&FamilyName=$familyName&FamilyNumber=$familyNumber&Phone=$familyPhone&NationalId=$nid";

    try {
      final response = await _apiServices.get(endPoint: endPoint);

      return right(FamilyResponse.fromJson(response));
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
  Future<Either<Failure, dynamic>> deleteFamily(
      {required String familyId}) async {
    final endPoint = "FamilySurvey/$familyId";

    try {
      final response = await _apiServices.delete(endPoint: endPoint);

      return right(response);
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
