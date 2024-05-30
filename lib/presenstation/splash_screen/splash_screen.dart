import 'package:bardimannn/data/data_sources/auth_local_datasource.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottom_navigation.dart';
import '../options_screen/options_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool slide = false;
  String token = "";
  // getToken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = pref.getString("token") ?? "";
  //   });
  // }

  @override
  void initState() {
    // getToken();
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      final authDataExist = await AuthLocalDatasources().isAuthDataExists();
      if (authDataExist) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigation(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OptionsScreen(),
            ));
      }
    });
  }

  onBack() {
    DoNothingAction();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onBack();
      },
      child: AnimatedSplashScreen(
        backgroundColor: AY600,
        splash: Container(
          // image
          child: Text(
            "Bardiman",
            style: Fonts.txt49semibold.copyWith(fontSize: 40, color: AY100),
          ),
        ),
        nextScreen: BottomNavigation(),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 1),
        curve: Curves.linear,
        disableNavigation: true,
        duration: 3000,
      ),
    );
  }
}
