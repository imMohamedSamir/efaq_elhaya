import 'family_model.dart';

class FamilyResponse {
  List<FamilyModel>? families;
  int? totalItems;

  FamilyResponse({this.families, this.totalItems});
  factory FamilyResponse.fromJson(Map<String, dynamic> json) => FamilyResponse(
      families: (json['families'] as List<dynamic>?)
          ?.map((e) => FamilyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['totalItems'] as int?);
}
