import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Errors/Failurs.dart';
import 'package:efaq_elhaya/Features/New_indv_form_view/data/models/indiv_form_model/indiv_form_model.dart';

abstract class IndivRepo {
  Future<Either<Failure, dynamic>> sendForm({required IndivFormModel form});
}
