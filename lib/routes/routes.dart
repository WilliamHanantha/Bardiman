import 'package:bardimannn/presenstation/auth/login_screen/login_screen.dart';
import 'package:bardimannn/presenstation/auth/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
};