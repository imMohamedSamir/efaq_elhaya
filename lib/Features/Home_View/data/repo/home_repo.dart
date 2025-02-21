import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';

abstract class HomeRepo {
  Future<Either<Failure, AppMetaData>> getMetaData();
}
