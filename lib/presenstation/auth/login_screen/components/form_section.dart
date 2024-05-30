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
  String errorText = "";
  bool isSaw = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Email Adress", style: Fonts.txt14medium),
          const Gap(16),
          shareWidget().textboxOutline("Insert Email Adress", false,
              TextInputType.text, widget.ctremail),
          const Gap(16),
          Text("Password", style: Fonts.txt14medium),
          const Gap(16),
          TextField(
            controller: widget.ctrpassword,
            obscureText: isSaw ? false : true,
            keyboardType: TextInputType.text,
            cursorColor: AY600,
            style: Fonts.txt12medium,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isSaw = !isSaw;
                  });
                },
                child: Icon(isSaw ? Icons.visibility : Icons.visibility_off,
                    color: Black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AY600, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              hintText: "Insert Passwod",
              hintStyle: Fonts.txt12regular.copyWith(color: Greytxt),
            ),
          ),
        ]),
        const Gap(16),
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
                  // Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text("Register",
                    style: Fonts.txt14regular.copyWith(color: AY600))),
          ],
        ),
      ],
    );
  }
}
