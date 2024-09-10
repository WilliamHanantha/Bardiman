import 'dart:io';
import 'package:bardimannn/presenstation/auth/register_screen/register_screen.dart';
import 'package:bardimannn/presenstation/options_screen/components/body_section.dart';
import 'package:bardimannn/presenstation/options_screen/components/option_section.dart';
import 'package:bardimannn/presenstation/profile_screen/profile_screen.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/share.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  void onBack() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Warning'),
        content: Text('Do you really want to exit'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () => exit(1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBack();
        return false;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Gap(80),
              BodyOptions(),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  navPush.push(context, const ProfileScreen());
                },
                child: shareWidget().buttonText(
                    "Bypass Profile",
                    Fonts.txt16medium.copyWith(color: White),
                    Border.all(color: AY600),
                    AY600,
                    140,
                    60),
              ),
              const Gap(20),
              OptionSection()
            ],
          ),
        ),
      ),
    );
  }
}
