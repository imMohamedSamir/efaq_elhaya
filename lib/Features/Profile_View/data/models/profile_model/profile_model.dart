import 'user_profile.dart';

class ProfileModel {
  List<dynamic>? surveys;
  UserProfile? userProfile;

  ProfileModel({this.surveys, this.userProfile});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        // surveys: json['surveys'] as List<dynamic>?,
        userProfile: json['userProfile'] == null
            ? null
            : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'surveys': surveys,
        'userProfile': userProfile?.toJson(),
      };
}
