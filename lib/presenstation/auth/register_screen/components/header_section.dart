import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderRegister extends StatefulWidget {
  const HeaderRegister({Key? key}) : super(key: key);

  @override
  State<HeaderRegister> createState() => _HeaderRegisterState();
}

class _HeaderRegisterState extends State<HeaderRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Register", style: Fonts.txt39semibold.copyWith(fontSize: 40)),
        Gap(16),
        Container(
          width: 305,
          child: Text("Find your best haircut here!",
              textAlign: TextAlign.left,
              style: Fonts.txt16regular.copyWith(color: Greytxt)),
        ),
      ]),
    );
  }
}
