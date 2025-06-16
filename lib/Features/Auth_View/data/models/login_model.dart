class LoginModel {
  dynamic message;
  bool? isAuthenticated;
  String? username;
  String? email;
  List<dynamic>? roles;
  String? token;
  String? expiresOn;
  String? refreshToken;
  DateTime? refreshTokenExpiration;

  LoginModel({
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.roles,
    this.token,
    this.expiresOn,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json['message'] as dynamic,
        isAuthenticated: json['isAuthenticated'] as bool?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        roles: json['roles'] as List<dynamic>?,
        token: json['token'] as String?,
        expiresOn: json['expiresOn'] as String?,
        refreshToken: json['refreshToken'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpiration'] as String),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'isAuthenticated': isAuthenticated,
        'username': username,
        'email': email,
        'roles': roles,
        'token': token,
        'expiresOn': expiresOn,
        'refreshToken': refreshToken,
        'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
      };
}
