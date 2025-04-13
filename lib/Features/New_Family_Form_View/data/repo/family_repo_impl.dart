import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/new_family_model.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo.dart';
import '../../../../Core/Network/ApiServices.dart';

class FamilyRepoImpl implements FamilyRepo {
  final ApiServices _apiServices;

  FamilyRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<Either<Failure, dynamic>> sendForm(
      {required NewFamilyModel form}) async {
    const endPoint = "FamilySurvey/add-family-survey";

    try {
      final response2 = await _apiServices.post(
          endPoint: endPoint, body: await form.toFormData(), isMulti: true);
      // var request = http.MultipartRequest('POST', uri);
      return right(response2);
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
