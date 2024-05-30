import 'dart:convert';

import 'package:bardimannn/core/constant/variables.dart';
import 'package:bardimannn/data/data_sources/auth_local_datasource.dart';
import 'package:bardimannn/data/models/auth_response_model.dart';
import 'package:bardimannn/data/models/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthRemoteDatasource {
  //Login
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}api/auth/login');
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final String errorMessage = responseBody['message'] ?? 'Unknown error';
      return Left(errorMessage);
    }
  }

  //make me register
  Future<Either<String, RegisterResponseModel>> register(
      String username, String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}api/auth/register');
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
    final Map<String, dynamic> responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      getUserDetail(responseBody['data']['token']);
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      final String errorMessage = responseBody['message'] ?? 'Unknown error';
      return Left(errorMessage);
    }
  }

  Future<void> getUserDetail(String? token) async {
    final url = Uri.parse('${Variables.baseUrl}api/user');
    final response = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      AuthLocalDatasources()
          .saveAuthData(AuthResponseModel.fromJson(response.body));
    } else {}
  }

  //Logout
  // Future<Either<String, bool>> logout() async {
  //   final authData = await AuthLocalDatasources().getAuthData();
  //   final url = Uri.parse('${Variables.baseUrl}api/auth/logout');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Authorization': 'Bearer ${authData.token}',
  //       'Accept': 'application/json',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return const Right(true);
  //   } else {
  //     return const Left('Failed to logout');
  //   }
  // }
}
