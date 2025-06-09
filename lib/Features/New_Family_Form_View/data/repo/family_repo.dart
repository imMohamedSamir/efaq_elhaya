import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/new_family_model.dart';

import '../../../../Core/Errors/Failurs.dart';

abstract class FamilyRepo {
  Future<Either<Failure, dynamic>> sendForm({required NewFamilyModel form});
  Future<Either<Failure, File>> getPdf({required String id});
}
