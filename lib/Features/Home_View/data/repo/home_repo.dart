import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';

abstract class HomeRepo {
  Future<Either<Failure, AppMetaData>> getMetaData();
  Future<Either<Failure, UserProfile>> getProflie();
}
