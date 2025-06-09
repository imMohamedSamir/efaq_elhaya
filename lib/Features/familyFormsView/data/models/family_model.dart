class FamilyModel {
  String? id;
  String? familyName;
  String? phone;
  String? address;
  String? familyNumber;
  FamilyModel({
    this.id,
    this.familyName,
    this.phone,
    this.address,
    this.familyNumber,
  });
  FamilyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyName = json['familyName'];
    phone = json['phone'];
    // address = json['address'];
    familyNumber = json['familyNumber'];
  }
}
