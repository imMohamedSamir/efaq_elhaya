class FamilyMember {
  String? familyNumber;
  String? relationToHead;
  FamilyMember({this.familyNumber, this.relationToHead});
  Map<String, dynamic> toJson() => {
        'familyNumber': familyNumber,
        'relationToHead': relationToHead,
      };
}
