import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 2)
class UserProfile extends HiveObject {
  @HiveField(0)
  String? firstName;

  @HiveField(1)
  String? lastName;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? gender;

  @HiveField(4)
  String? phoneNumber;

  @HiveField(5)
  String? userName;

  UserProfile({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.userName,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        userName: json['userName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'userName': userName,
      };
}
