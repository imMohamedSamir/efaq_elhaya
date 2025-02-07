import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Core/Network/ApiServices.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/login_model.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/registration_model.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices _apiServices;

  AuthRepoImpl({required ApiServices apiServices}) : _apiServices = apiServices;

  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password}) async {
    try {
      const endPoint = "Auth/token";
      final response = await _apiServices.post(
          endPoint: endPoint,
          body: jsonEncode({"email": email, "password": password}));
      return right(LoginModel.fromJson(response));
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signUp(
      {required RegistrationModel model}) async {
    const endPoint = "Auth/RegisterNewUser";
    try {
      final response =
          await _apiServices.post(endPoint: endPoint, body: model.toJson());
      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
