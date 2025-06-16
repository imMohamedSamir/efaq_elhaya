import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/cities.dart';
import 'package:hive/hive.dart';

part 'app_meta_data.g.dart';

@HiveType(typeId: 0)
class AppMetaData extends HiveObject {
  @HiveField(0)
  List<String>? governorates;

  @HiveField(1)
  Cities? cities;

  @HiveField(2)
  List<String>? centers;

  @HiveField(3)
  List<String>? maritalStatus;

  @HiveField(4)
  List<String>? workTitles;

  @HiveField(5)
  List<String>? educationLevels;

  @HiveField(6)
  List<String>? surveyStatus;

  @HiveField(7)
  List<String>? surveyCheckboxOptions;

  @HiveField(8)
  List<String>? furnitureTypes;

  AppMetaData({
    this.governorates,
    this.cities,
    this.centers,
    this.maritalStatus,
    this.workTitles,
    this.educationLevels,
    this.surveyStatus,
    this.surveyCheckboxOptions,
    this.furnitureTypes,
  });

  factory AppMetaData.fromJson(Map<String, dynamic> json) => AppMetaData(
        governorates: (json['Governorates'] as List<dynamic>?)?.cast<String>(),
        cities: json['Cities'] == null
            ? null
            : Cities.fromJson(json['Cities'] as Map<String, dynamic>),
        centers: (json['Centers'] as List<dynamic>?)?.cast<String>(),
        maritalStatus:
            (json['MaritalStatus'] as List<dynamic>?)?.cast<String>(),
        workTitles: (json['WorkTitles'] as List<dynamic>?)?.cast<String>(),
        educationLevels:
            (json['EducationLevels'] as List<dynamic>?)?.cast<String>(),
        surveyStatus: (json['SurveyStatus'] as List<dynamic>?)?.cast<String>(),
        surveyCheckboxOptions:
            (json['SurveyCheckboxOptions'] as List<dynamic>?)?.cast<String>(),
        furnitureTypes:
            (json['FurnitureTypes'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'Governorates': governorates,
        'Cities': cities?.toJson(),
        'Centers': centers,
        'MaritalStatus': maritalStatus,
        'WorkTitles': workTitles,
        'EducationLevels': educationLevels,
        'SurveyStatus': surveyStatus,
        'SurveyCheckboxOptions': surveyCheckboxOptions,
        'FurnitureTypes': furnitureTypes,
      };
}
