import 'dart:convert';

class RegisterResponseModel {
  final bool? success;
  final String? message;
  final Data? data;

  RegisterResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterResponseModel.fromJson(String str) => RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) => RegisterResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  final String? token;
  final String? username;

  Data({
    this.token,
    this.username,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    token: json["token"],
    username: json["username"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "username": username,
  };
}
