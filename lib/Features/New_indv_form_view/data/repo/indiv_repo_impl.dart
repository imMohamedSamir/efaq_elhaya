import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Core/Network/TokenManger.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/indiv_form_model.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/repo/indiv_repo.dart';

class IndivRepoImpl implements IndivRepo {
  final ApiServices _apiServices;

  IndivRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<Either<Failure, dynamic>> sendForm(
      {required IndivFormModel form}) async {
    final token = await TokenManager.getUserToken();
    const endPoint = "IndividualSurvey/AddIndividualPhone";

    try {
      final response = await _apiServices.post(
          endPoint: endPoint, body: form.toJson(), token: token);
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
