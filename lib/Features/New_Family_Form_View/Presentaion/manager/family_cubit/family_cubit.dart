import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:efaq_elhaya/Core/Utlis/ToastificationMethod.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/expenses.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/family_address.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/furniture.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/medicines.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/models/new_family_model/new_family_model.dart';
import 'package:efaq_elhaya/Features/New_Family_Form_View/data/repo/family_repo.dart';
import 'package:efaq_elhaya/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'family_state.dart';

class FamilyCubit extends Cubit<FamilyState> {
  FamilyCubit(this._repo) : super(FamilyInitial());
  final FamilyRepo _repo;
//========================== controllers ================================
  final TextEditingController totalExpensesController = TextEditingController();
  final TextEditingController netIncomeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//========================== initial models ================================
  ExpensesModel expensesModel = ExpensesModel();
  Furniture furniture = Furniture();
  Medicines medicines = Medicines();
  FamilyAddress address = FamilyAddress();
  NewFamilyModel newFamilyModel = NewFamilyModel();
  Map<String, File> docData = {};
  Map<String, File> imgData = {};

//============================= methods =============================

  void setExpenses(String key, String value) {
    final double expenseValue = double.tryParse(value) ?? 0;

    switch (key) {
      case 'transportation':
        expensesModel.transportation = expenseValue;
        break;
      case 'electricity':
        expensesModel.electricity = expenseValue;
        break;
      case 'gas':
        expensesModel.gas = expenseValue;
        break;
      case 'waterBill':
        expensesModel.waterBill = expenseValue;
        break;
      case 'food':
        expensesModel.food = expenseValue;
        break;
      case 'Other':
        expensesModel.other = expenseValue;
        break;
      case 'education':
        expensesModel.education = expenseValue;
        break;
      case 'rent':
        expensesModel.rent = expenseValue;
        break;
    }

    // Recalculate total expenses
    final newTotal = expensesModel.calculateTotalExpenses();
    totalExpensesController.text = newTotal.toStringAsFixed(1);
    expensesModel.netIncome = ((newFamilyModel.totalIncome ?? 0) - newTotal);
    netIncomeController.text = expensesModel.netIncome.toString();
  }

  void setIncome({required String value}) {
    final double incomeValue = double.tryParse(value) ?? 0;
    final double totaleExpenses = expensesModel.calculateTotalExpenses();
    newFamilyModel.totalIncome = incomeValue;
    expensesModel.netIncome = (incomeValue - totaleExpenses);
    netIncomeController.text = expensesModel.netIncome.toString();
  }

  void _handlFiles() {
    newFamilyModel.images = imgData.values.toList();
    newFamilyModel.legalPapers = docData.values.toList();
    newFamilyModel.legalPaperKeys = docData.keys.toList();
    newFamilyModel.imageDescriptions = imgData.keys.toList();
  }

  void sendForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(FamilyLoading());
      newFamilyModel.address = address;
      newFamilyModel.expenses = expensesModel;
      newFamilyModel.medicines = medicines;
      newFamilyModel.furniture = furniture;
      _handlFiles();
      log(newFamilyModel.toJson().toString());
      final result = await _repo.sendForm(form: newFamilyModel);
      result.fold((fail) {
        emit(FamilyFailure());
        CustomToastification.errorDialog(content: LocaleKeys.indvErrorMsg.tr());
      }, (success) {
        CustomDialog.SuccessForm();
        emit(FamilySuccess());
      });
    } else {
      emit(FamilyFailure());
      CustomToastification.errorDialog(
          content: LocaleKeys.genericValidation.tr());
    }
  }

  // void _handlepdf() async {
  //   final result = await Dio().get(
  //       "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
  //   final bytes = result.data;
  //   final dir = await getTemporaryDirectory();
  //   final file = File('${dir.path}/dummy.pdf');
  //   await file.writeAsBytes(bytes);
  // }
}
