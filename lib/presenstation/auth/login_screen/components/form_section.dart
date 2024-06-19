import 'package:bardimannn/presenstation/auth/register_screen/register_screen.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../widgets/share.dart';

class FormSectionLogin extends StatefulWidget {
  FormSectionLogin(
      {Key? key,
      required this.ctremail,
      required this.ctrpassword,
      required this.onTap})
      : super(key: key);
  final TextEditingController ctremail;
  final TextEditingController ctrpassword;
  final Function() onTap;

  @override
  State<FormSectionLogin> createState() => _FormSectionLoginState();
}

class _FormSectionLoginState extends State<FormSectionLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          shareWidget().textboxOutline("Email Adress", "Insert Email Adress",
              false, TextInputType.text, widget.ctremail),
          shareWidget().textboxOutline(
            "Password",
            "Insert Password",
            true,
            TextInputType.text,
            widget.ctrpassword,
            isPassword: true,
          )
        ]),
        Row(
          children: [
            Spacer(),
            GestureDetector(
                child: Text("Forgot Password?",
                    style: Fonts.txt12regular.copyWith(color: AY600))),
          ],
        ),
        Gap(150),
        shareWidget().buttonFilled(
            "Login",
            widget.onTap,
            Fonts.txt20medium.copyWith(color: White),
            double.infinity,
            50,
            0,
            0),
        Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an Bardiman account? ", style: Fonts.txt14regular),
            GestureDetector(
                onTap: () {
                  navPush.push(context, const RegisterScreen());
                },
                child: Text("Register",
                    style: Fonts.txt14regular.copyWith(color: AY600))),
          ],
        ),
      ],
    );
  }
}
