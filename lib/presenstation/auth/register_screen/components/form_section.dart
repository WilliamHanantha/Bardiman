import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/share.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';

import '../../login_screen/login_screen.dart';

class FormSectionRegister extends StatefulWidget {
  FormSectionRegister(
      {Key? key,
      required this.onTap,
      required this.ctrusername,
      required this.ctremail,
      required this.ctrpassword,
      required this.ctrphone,
      required this.ctrgender,
      required this.ctrdate,
      required this.ctrmonth,
      required this.ctryear})
      : super(key: key);
  final TextEditingController ctrusername;
  final TextEditingController ctremail;
  final TextEditingController ctrpassword;
  final TextEditingController ctrphone;
  final TextEditingController ctrgender;
  final TextEditingController ctrdate;
  final TextEditingController ctrmonth;
  final TextEditingController ctryear;
  final Function() onTap;

  @override
  State<FormSectionRegister> createState() => _FormSectionRegisterState();
}

class _FormSectionRegisterState extends State<FormSectionRegister> {
  String dropdownValue = 'Male';
  List<String> genderOptions = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: shareWidget().textboxOutline(
                "Username",
                "Insert Username",
                false,
                TextInputType.text,
                widget.ctrusername,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: shareWidget().dropDownButton(
                "Gender",
                "Gender",
                genderOptions,
                dropdownValue,
                (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.ctrgender.text = newValue;
                  });
                },
              ),
            )
          ],
        ),
        shareWidget().phoneNumberField(
          "Mobile Number",
          "Enter your phone number",
          widget.ctrphone,
        ),
        shareWidget().textboxOutline(
          "Email Adress",
          "Insert Email Adress",
          false,
          TextInputType.text,
          widget.ctremail,
        ),
        shareWidget().textboxOutline(
          "Password",
          "Insert Password",
          true,
          TextInputType.text,
          widget.ctrpassword,
          isPassword: true,
        ),
        Text(
          "Date of Birth",
          style: Fonts.txt14regular,
        ),
        const Gap(16),
        DropdownDatePicker(
          dateformatorder: OrderFormat.DMY, // optional
          inputDecoration: InputDecoration(
              iconColor: AY600,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8C8476), width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AY600, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AY600, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              )), // optional

          isDropdownHideUnderline: true, // optional
          isFormValidator: true, // optional
          startYear: 1900, // optional
          endYear: 2022, // optional
          textStyle: Fonts.txt12regular,
          isExpanded: false,
          width: 3,
          onChangedDay: (value) => {widget.ctrdate.text = value.toString()},
          onChangedMonth: (value) => {widget.ctrmonth.text = value.toString()},
          onChangedYear: (value) => {widget.ctryear.text = value.toString()},
          dayFlex: 2, // optional
          monthFlex: 3,
          yearFlex: 2,
        ),
        const Gap(90),
        shareWidget().buttonFilled("Register", () {
          if (widget.ctrusername.text.isNotEmpty &&
              widget.ctremail.text.isNotEmpty &&
              widget.ctrpassword.text.isNotEmpty &&
              widget.ctrpassword.text.length >= 8 &&
              widget.ctremail.text.contains("@")) {
            widget.onTap();
          } else if (widget.ctrusername.text.isEmpty) {
            shareWidget().showToast(context, "Username cannot be empty");
          } else if (widget.ctremail.text.isEmpty) {
            shareWidget().showToast(context, "Email cannot be empty");
          } else if (widget.ctremail.text.contains("@") == false ||
              widget.ctremail.text.contains(".") == false) {
            shareWidget().showToast(context, "Email is not valid");
          } else if (widget.ctrpassword.text.isEmpty) {
            shareWidget().showToast(context, "Password cannot be empty");
          } else if (widget.ctrpassword.text.length < 8) {
            shareWidget()
                .showToast(context, "Password must be at least 8 characters");
          }
        }, Fonts.txt20medium.copyWith(color: White), double.infinity, 50, 0, 0),
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
                  navPush.push(context, const LoginScreen());
                },
                child: Text("Login",
                    style: Fonts.txt14regular.copyWith(color: AY600))),
          ],
        )
      ],
    );
  }
}
