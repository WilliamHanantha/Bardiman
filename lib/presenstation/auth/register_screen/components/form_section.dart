import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/share.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../login_screen/login_screen.dart';

class FormSectionRegister extends StatefulWidget {
  FormSectionRegister(
      {Key? key,
      required this.onTap,
      required this.ctrusername,
      required this.ctremail,
      required this.ctrpassword})
      : super(key: key);
  final TextEditingController ctrusername;
  final TextEditingController ctremail;
  final TextEditingController ctrpassword;
  final Function() onTap;

  @override
  State<FormSectionRegister> createState() => _FormSectionRegisterState();
}

class _FormSectionRegisterState extends State<FormSectionRegister> {
  String errorText = "";
  bool isSaw = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Username", style: Fonts.txt14medium),
          const Gap(16),
          shareWidget().textboxOutline(
              "Insert Username", false, TextInputType.text, widget.ctrusername),
          const Gap(16),
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
        const Gap(90),
        shareWidget().buttonFilled(
            "Register",
            widget.onTap,
            Fonts.txt20medium.copyWith(color: White),
            double.infinity,
            50,
            0,
            0),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: Fonts.txt14regular,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Text("Login",
                    style: Fonts.txt14regular.copyWith(color: AY600))),
          ],
        )
      ],
    );
  }
}
