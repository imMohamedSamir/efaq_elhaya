import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/new_family_model.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo.dart';
import 'package:path_provider/path_provider.dart';
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
      final response = await _apiServices.post(
          endPoint: endPoint, body: await form.toFormData(), isMulti: true);
      return right(response["id"]);
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
  Future<Either<Failure, File>> getPdf({required String id}) async {
    final endPoint = "FamilySurvey/$id/pdf";

    try {
      final response = await _apiServices.get(endPoint: endPoint, isPdf: true);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$id.pdf');
      await file.writeAsBytes(response);
      log(file.toString());
      // log(response.toString());
      return right(file);
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
