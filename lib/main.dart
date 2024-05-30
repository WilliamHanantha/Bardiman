import 'package:bardimannn/data/data_sources/auth_remote_datasources.dart';
import 'package:bardimannn/data/models/register_response_model.dart';
import 'package:bardimannn/presenstation/auth/bloc/login/login_bloc.dart';
import 'package:bardimannn/presenstation/auth/bloc/register/register_bloc.dart';
import 'package:bardimannn/presenstation/splash_screen/splash_screen.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(create: (context) => RegisterBloc(AuthRemoteDatasource())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          scaffoldBackgroundColor: White,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.amber),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
