import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/familyFormsView/data/models/FamilyResponse.dart';

abstract class FamiliesRepo {
  Future<Either<Failure, FamilyResponse>> getFamiliesData(
      {int page = 1,
      int pageSize = 10,
      String? familyNumber,
      String? familyName,
      String? familyPhone,
      String? familyAddress,
      String? nid});
  Future<Either<Failure, dynamic>> deleteFamily({
    required String familyId,
  });
}
