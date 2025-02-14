import 'address.dart';
import 'employment.dart';
import 'survey_source.dart';

class IndivFormModel {
  String? name;
  String? nationalId;
  String? identity;
  IndivAddress? address;
  String? birthDate;
  int? ageAtRegistration;
  String? deathDate;
  String? gender;
  String? maritalStatus;
  String? marriageDate;
  String? phone;
  String? familyNumber;
  String? familySource;
  String? educationLevel;
  String? healthStatus;
  List<String>? medications;
  double? treatmentCost;
  String? privateLessons;
  bool? literacySupport;
  List<String>? skills;
  IndivEmployment? employment;
  String? surveyDate;
  String? researcherName;
  String? lastModifiedBy;
  String? registrationDate;
  String? registrationLocation;
  String? cancellationReason;
  String? notes;
  String? status;
  IndivSurveySource? surveySource;

  IndivFormModel({
    this.name,
    this.nationalId,
    this.identity,
    this.address,
    this.birthDate,
    this.ageAtRegistration,
    this.deathDate,
    this.gender,
    this.maritalStatus,
    this.marriageDate,
    this.phone,
    this.familyNumber,
    this.familySource,
    this.educationLevel,
    this.healthStatus,
    this.medications,
    this.treatmentCost,
    this.privateLessons,
    this.literacySupport,
    this.skills,
    this.employment,
    this.surveyDate,
    this.researcherName,
    this.lastModifiedBy,
    this.registrationDate,
    this.registrationLocation,
    this.cancellationReason,
    this.notes,
    this.status,
    this.surveySource,
  });

  factory IndivFormModel.fromJson(Map<String, dynamic> json) {
    return IndivFormModel(
      name: json['name'] as String?,
      nationalId: json['nationalId'] as String?,
      identity: json['identity'] as String?,
      address: json['address'] == null
          ? null
          : IndivAddress.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] as String?,
      ageAtRegistration: json['ageAtRegistration'] as int?,
      deathDate: json['deathDate'] as String?,
      gender: json['gender'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      marriageDate: json['marriageDate'] as String?,
      phone: json['phone'] as String?,
      familyNumber: json['familyNumber'] as String?,
      familySource: json['familySource'] as String?,
      educationLevel: json['educationLevel'] as String?,
      healthStatus: json['healthStatus'] as String?,
      medications: json['medications'] as List<String>?,
      treatmentCost: json['treatmentCost'] as double?,
      privateLessons: json['privateLessons'] as String?,
      literacySupport: json['literacySupport'] as bool?,
      skills: json['skills'] as List<String>?,
      employment: json['employment'] == null
          ? null
          : IndivEmployment.fromJson(
              json['employment'] as Map<String, dynamic>),
      surveyDate: json['surveyDate'] as String?,
      researcherName: json['researcherName'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      registrationDate: json['registrationDate'] as String?,
      registrationLocation: json['registrationLocation'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String?,
      surveySource: json['surveySource'] == null
          ? null
          : IndivSurveySource.fromJson(
              json['surveySource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'nationalId': nationalId,
        'identity': identity,
        'address': address?.toJson(),
        'birthDate': birthDate,
        'ageAtRegistration': ageAtRegistration,
        'deathDate': deathDate,
        'gender': gender,
        'maritalStatus': maritalStatus,
        'marriageDate': marriageDate,
        'phone': phone,
        'familyNumber': familyNumber,
        'familySource': familySource,
        'educationLevel': educationLevel,
        'healthStatus': healthStatus,
        'medications': medications,
        'treatmentCost': treatmentCost,
        'privateLessons': privateLessons,
        'literacySupport': literacySupport,
        'skills': skills,
        'employment': employment?.toJson(),
        'surveyDate': surveyDate,
        'researcherName': researcherName,
        'lastModifiedBy': lastModifiedBy,
        'registrationDate': registrationDate,
        'registrationLocation': registrationLocation,
        'cancellationReason': cancellationReason,
        'notes': notes,
        'status': status,
        'surveySource': surveySource?.toJson(),
      };
}
