import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Login", style: Fonts.txt39semibold.copyWith(fontSize: 40)),
        Gap(16),
        Container(
          width: 305,
          child: Text("Welcome back you’ve been missed!",
              textAlign: TextAlign.left,
              style: Fonts.txt16regular.copyWith(color: Greytxt)),
        ),
      ]),
    );
  }
}
