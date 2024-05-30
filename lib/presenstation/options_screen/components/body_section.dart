import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BodyOptions extends StatelessWidget {
  const BodyOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(
              image: AssetImage("assets/images/intro-options.png"),
              height: 300,
              width: 300),
          Container(
            // width: AppLayout.getScreenWidth() / 1.5,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              textAlign: TextAlign.center,
              "A Platform built to help reserve barbershop",
              style: Fonts.txt20semibold,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find",
                style: Fonts.txt12semibold,
              ),
              Text(" and", style: Fonts.txt12regular),
              Text(" Improve", style: Fonts.txt12medium),
              Text(" your", style: Fonts.txt12regular),
              Text(" HairStyle", style: Fonts.txt12medium),
            ],
          )
        ],
      ),
    );
  }
}
