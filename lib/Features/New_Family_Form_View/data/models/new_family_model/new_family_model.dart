import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'family_address.dart';
import 'expenses.dart';
import 'furniture.dart';
import 'medicines.dart';

class NewFamilyModel {
  String? familyNumber;
  String? familyName;
  String? nationalId;
  FamilyAddress? address;
  List<String>? incomeSources;
  double? totalIncome;
  Medicines? medicines;
  ExpensesModel? expenses;
  String? researcherOpinion;
  String? registrationLocation;
  String? privateLessons;
  String? notes;
  String? foodBank;
  String? status;
  String? lastDistrbution;
  String? mobileType;
  String? validForDevelpoment;
  String? conditionSource;
  String? educated;
  String? valid;
  String? currentCondition;
  Furniture? furniture;
  List<File>? legalPapers;
  List<File>? images;
  List<String>? imageDescriptions;
  List<String>? legalPaperKeys;

  NewFamilyModel({
    this.familyNumber,
    this.familyName,
    this.nationalId,
    this.address,
    this.incomeSources,
    this.totalIncome,
    this.medicines,
    this.expenses,
    this.researcherOpinion,
    this.registrationLocation,
    this.privateLessons,
    this.notes,
    this.foodBank,
    this.status,
    this.lastDistrbution,
    this.mobileType,
    this.validForDevelpoment,
    this.conditionSource,
    this.educated,
    this.valid,
    this.currentCondition,
    this.furniture,
    this.legalPapers,
    this.images,
    this.imageDescriptions,
    this.legalPaperKeys,
  }) {
    incomeSources = [];
    legalPapers = [];
    images = [];
    imageDescriptions = [];
    legalPaperKeys = [];
  }

  factory NewFamilyModel.fromJson(Map<String, dynamic> json) {
    return NewFamilyModel(
      familyNumber: json['familyNumber'] as String?,
      familyName: json['familyName'] as String?,
      nationalId: json['nationalId'] as String?,
      address: json['address'] == null
          ? null
          : FamilyAddress.fromJson(json['address'] as Map<String, dynamic>),
      incomeSources: json['incomeSources'] as List<String>?,
      totalIncome: json['totalIncome'] as double?,
      medicines: json['medicines'] == null
          ? null
          : Medicines.fromJson(json['medicines'] as Map<String, dynamic>),
      expenses: json['expenses'] == null
          ? null
          : ExpensesModel.fromJson(json['expenses'] as Map<String, dynamic>),
      researcherOpinion: json['researcherOpinion'] as String?,
      registrationLocation: json['registrationLocation'] as String?,
      privateLessons: json['privateLessons'] as String?,
      notes: json['notes'] as String?,
      foodBank: json['foodBank'] as String?,
      status: json['status'] as String?,
      lastDistrbution: json['lastDistrbution'] as String?,
      mobileType: json['mobileType'] as String?,
      validForDevelpoment: json['validForDevelpoment'] as String?,
      conditionSource: json['conditionSource'] as String?,
      educated: json['educated'] as String?,
      valid: json['valid'] as String?,
      currentCondition: json['currentCondition'] as String?,
      furniture: json['furniture'] == null
          ? null
          : Furniture.fromJson(json['furniture'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'familyNumber': familyNumber,
        'familyName': familyName,
        'nationalId': nationalId,
        'address': address?.toJson(),
        'incomeSources': incomeSources,
        'totalIncome': totalIncome,
        'medicines': medicines?.toJson(),
        'expenses': expenses?.toJson(),
        'researcherOpinion': researcherOpinion,
        'registrationLocation': registrationLocation,
        'privateLessons': privateLessons,
        'notes': notes,
        'foodBank': foodBank,
        'status': status,
        'lastDistrbution': lastDistrbution,
        'mobileType': mobileType,
        'validForDevelpoment': validForDevelpoment,
        'conditionSource': conditionSource,
        'educated': educated,
        'valid': valid,
        'currentCondition': currentCondition,
        'furniture': furniture?.toJson(),
        'legalPapers': legalPapers,
        'images': images,
        'imageDescriptions': imageDescriptions,
        'legalPaperKeys': legalPaperKeys,
      };

  Future<FormData> toFormData() async {
    final formData = FormData.fromMap({
      'FamilyNumber': familyNumber ?? 'string',
      'FamilyName': familyName ?? 'string',
      'NationalId': nationalId ?? 'string',
      'Address.Governorate': address?.governorate ?? 'string',
      'Address.City': address?.city ?? 'string',
      'Address.FullAddress': address?.fullAddress ?? 'string',
      'Address.Region': address?.region ?? 'string',
      'IncomeSources': incomeSources?.join(',') ?? 'string',
      'TotalIncome': totalIncome?.toString() ?? '0',
      'Medicines.Name': medicines?.name ?? 'string',
      'Medicines.Cost': medicines?.cost?.toString() ?? '0',
      'Medicines.Description': medicines?.description ?? 'string',
      'Medicines.Dose': medicines?.dose ?? 'string',
      'Medicines.ImageUrl': medicines?.imageUrl ?? 'string',
      'Expenses.TotalExpenses': expenses?.totalExpenses.toString() ?? '0',
      'Expenses.Rent': expenses?.rent.toString() ?? '0',
      'Expenses.Food': expenses?.food.toString() ?? '0',
      'Expenses.Transportation': expenses?.transportation.toString() ?? '0',
      'Expenses.TotalExpensesDescribtion':
          expenses?.totalExpensesDescription ?? 'string',
      'ResearcherOpinion': researcherOpinion ?? 'string',
      'RegistrationLocation': registrationLocation ?? 'string',
      'PrivateLessons': privateLessons ?? 'string',
      'Notes': notes ?? 'string',
      'FoodBank': foodBank ?? 'string',
      'Status': status ?? 'string',
      'LastDistrbution': lastDistrbution ?? 'string',
      'MobileType': mobileType ?? 'string',
      'ValidForDevelpoment': validForDevelpoment ?? 'string',
      'ConditionSource': conditionSource ?? 'string',
      'Educated': educated ?? 'string',
      'Valid': valid ?? 'string',
      'CurrentCondition': currentCondition ?? 'string',
      'Furniture.HomeDescription': furniture?.homeDescription ?? 'string',
      'Furniture.NumberOfRooms': furniture?.numberOfRooms?.toString() ?? '0',
      'Furniture.FurnitureDescription':
          furniture?.furnitureDescription ?? 'string',
      'Furniture.HouseCondition': furniture?.houseCondition ?? 'string',
      'legalPaperKeys': legalPaperKeys?.join(',') ?? 'string',
      'imageDescriptions': imageDescriptions?.join(',') ?? 'string',
    });
    // Add files (legal papers)
    for (var file in legalPapers ?? []) {
      formData.files.add(MapEntry(
        'legalPapers',
        await MultipartFile.fromFile(file.path,
            filename: file.uri.pathSegments.last),
      ));
    }

    // Add images
    for (var file in images ?? []) {
      formData.files.add(MapEntry(
        'images',
        await MultipartFile.fromFile(file.path,
            filename: file.uri.pathSegments.last),
      ));
    }
    log(formData.fields.toString());
    return formData;
  }
}
