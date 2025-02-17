import 'dart:convert';

// ignore: non_constant_identifier_names
LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String accessToken;
  final String tokenType;

  LoginModel({
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
