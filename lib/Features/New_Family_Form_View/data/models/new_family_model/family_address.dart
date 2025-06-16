class FamilyAddress {
  String? governorate;
  String? city;
  String? region;
  String? fullAddress;

  FamilyAddress({this.governorate, this.city, this.region, this.fullAddress});

  factory FamilyAddress.fromJson(Map<String, dynamic> json) => FamilyAddress(
        governorate: json['governorate'] as String?,
        city: json['city'] as String?,
        region: json['region'] as String?,
        fullAddress: json['fullAddress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'governorate': governorate,
        'city': city,
        'region': region,
        'fullAddress': fullAddress,
      };
}
