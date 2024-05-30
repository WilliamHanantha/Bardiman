import 'dart:convert';

import 'package:bardimannn/core/constant/variables.dart';
import 'package:bardimannn/data/models/auth_response_model.dart';
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
