import 'dart:io';
import 'package:bardimannn/presenstation/options_screen/components/body_section.dart';
import 'package:bardimannn/presenstation/options_screen/components/option_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OptionsScreen extends StatefulWidget {
  static String routeName = "/optionsscreen";
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
              OptionSection()
            ],
          ),
        ),
      ),
    );
  }
}
