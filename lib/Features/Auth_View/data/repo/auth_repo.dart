import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/login_model.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/registration_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> signUp({required RegistrationModel model});
  Future<void> signOut();
}
