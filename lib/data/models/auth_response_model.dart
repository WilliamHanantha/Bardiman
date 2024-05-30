import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final User? user;
  final String? token;

  AuthResponseModel({
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
        "token": token,
      };
}

class User {
  final String? username;
  final String? email;
  final String? profilePhotoPath;
  final int? age;
  final String? adress;
  final String? phoneNumber;
  final dynamic emailVerifiedAt;

  User({
    this.username,
    this.email,
    this.profilePhotoPath,
    this.age,
    this.adress,
    this.phoneNumber,
    this.emailVerifiedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        profilePhotoPath: json["profile_photo_path"],
        age: json["age"],
        adress: json["adress"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "profile_photo_path": profilePhotoPath,
        "age": age,
        "adress": adress,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt,
      };
}
