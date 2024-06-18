import 'package:bardimannn/data/models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasources {
  Future<void> saveAuthData(User user, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', user.toJson());
    await prefs.setString('token', token);
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
  }

  Future<User> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('user_data');

    return User.fromJson(authData!);
  }

  Future<bool> isAuthDataExists() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user_data');
  }
}
