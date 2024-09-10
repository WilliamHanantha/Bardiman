import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class shareWidget {
  Widget textboxOutline(String title, String hintText, bool obscureText,
      TextInputType keyboardType, TextEditingController controller,
      {bool isPassword = false}) {
    final ValueNotifier<bool> isSaw = ValueNotifier<bool>(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Fonts.txt14medium),
        const Gap(16),
        isPassword
            ? ValueListenableBuilder<bool>(
                valueListenable: isSaw,
                builder: (BuildContext context, bool value, Widget? child) {
                  return TextField(
                    controller: controller,
                    obscureText: value ? false : true,
                    keyboardType: TextInputType.text,
                    cursorColor: AY600,
                    style: Fonts.txt12medium,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isSaw.value = !isSaw.value;
                        },
                        child: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                            color: Black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AY600, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Greytxt),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      hintText: hintText,
                      hintStyle: Fonts.txt12regular.copyWith(color: Greytxt),
                    ),
                  );
                },
              )
            : TextField(
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                cursorColor: AY600,
                style: Fonts.txt12medium,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AY600, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Greytxt),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  hintText: hintText,
                  hintStyle: Fonts.txt12regular.copyWith(color: Greytxt),
                ),
              ),
        const Gap(16)
      ],
    );
  }

  Widget phoneNumberField(
      String title, String hintText, TextEditingController controller) {
    controller.text = '+62  ';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Fonts.txt14medium),
        const Gap(16),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          cursorColor: AY600,
          style: Fonts.txt12medium,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AY600, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Greytxt),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            hintText: hintText,
            hintStyle: Fonts.txt12regular.copyWith(color: Greytxt),
          ),
          onChanged: (String value) {
            if (value.length < 4) {
              controller.text = '+62 ';
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length));
            }
          },
        ),
        const Gap(16)
      ],
    );
  }

  Widget dropDownButton(String title, String hintText, List<String> items,
      String value, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Fonts.txt14medium),
        const Gap(16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF8C8476)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: value,
            hint: Text(hintText),
            style: Fonts.txt12regular,
            isExpanded: true,
            underline: Container(),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        const Gap(16),
      ],
    );
  }

  Widget buttonFilled(
      String text,
      VoidCallback onTap,
      TextStyle styles,
      double width,
      double height,
      double horizontalPadding,
      double verticalPadding) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: AY600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: styles,
          ),
        ),
      ),
    );
  }

  Widget buttonOutlineImage(
      Image icons, VoidCallback onTap, double width, double height) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: White,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AY600),
        ),
        child: Center(child: icons),
      ),
    );
  }

  Widget buttonText(String text, TextStyle style, Border borderColor,
      Color fillColor, double Width, double Height) {
    return Container(
      width: Width,
      height: Height,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: borderColor,
      ),
      child: Center(
        child: Text(text, style: style),
      ),
    );
  }

  Widget buttonOutlineIconText(
      Icon icons,
      String text,
      TextStyle style,
      double radius,
      Color color,
      VoidCallback onTap,
      double width,
      double height) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: White,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [icons, Text(text, style: style)],
          )),
    );
  }

  Widget textFieldUnderline(String hintText, bool obscureText,
      TextInputType keyboardType, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: AY600,
      style: Fonts.txt16semibold.copyWith(fontSize: 17),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AY600, width: 2.0),
        ),
        hintText: hintText,
      ),
    );
  }

  Widget textFieldUnderLineLabel(String hintText, bool obscureText,
      TextInputType keyboardType, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: AY600,
      style: Fonts.txt14medium,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AY600, width: 2),
        ),
        label: Text(hintText),
        labelStyle: Fonts.txt16medium.copyWith(color: Greytxt),
      ),
    );
  }

  Widget privacyPolicy(
    Icon icons,
    String title,
    String desc,
  ) {
    return Container(
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icons,
          Gap(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Fonts.txt16medium,
              ),
              Gap(8),
              Container(
                width: 300,
                child: Text(
                  desc,
                  style: Fonts.txt12regular,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget ContainerMethod(Icon icons, String title, String desc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 100,
      decoration:
          BoxDecoration(color: AY300, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Container(
          width: 60,
          height: 60,
          child: icons,
          decoration: BoxDecoration(
              color: AY100, borderRadius: BorderRadius.circular(32)),
        ),
        Gap(18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Fonts.txt14bold,
            ),
            Text(
              desc,
              style: Fonts.txt12medium,
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 32,
            ))
      ]),
    );
  }

  Widget shimmerContainer(double width, double height, double radius) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }

  Widget dashLine() {
    return SizedBox(
      height: 24,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                (constraints.constrainWidth() / 6).floor(),
                (index) => SizedBox(
                      width: 3,
                      height: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Grey),
                      ),
                    )),
          );
        },
      ),
    );
  }

  Widget profileRow(VoidCallback onTap, Icon icon, String text) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: Colors.transparent,
        child: Row(
          children: [
            icon,
            Gap(12),
            Text(
              text,
              style: Fonts.txt16medium,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Black,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 550;

  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

class shareValue {
  String todayDate = DateFormat('EEEE, d MMM').format(DateTime.now());
}

class shareValueMonth {
  String todayDate = DateFormat('MMMM yyyy').format(DateTime.now());
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String priceFormat() => replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
}

class navPush {
  static push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
