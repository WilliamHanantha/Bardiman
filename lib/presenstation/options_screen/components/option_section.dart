import 'package:bardimannn/presenstation/auth/login_screen/login_screen.dart';
import 'package:bardimannn/presenstation/auth/register_screen/register_screen.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/share.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OptionSection extends StatelessWidget {
  const OptionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
           navPush.push(context, const RegisterScreen());
          },
          child: shareWidget().buttonText(
              "Register",
              Fonts.txt16medium.copyWith(color: White),
              Border.all(color: AY600),
              AY600,
              140,
              60),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            navPush.push(context, const LoginScreen());
          },
          child: shareWidget().buttonText(
              "Login",
              Fonts.txt16medium.copyWith(color: AY600),
              Border.all(color: AY600),
              White,
              140,
              60),
        ),
      ],
    );
  }
}
