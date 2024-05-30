
// import 'package:bardiman/pages/privacy_screen/privacy_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import '../../../values/styles.dart';
// import '../../../widgets/share.dart';

// import '../../login_screen/login_screen.dart';

// class FormSectionRegister extends StatefulWidget {
//   FormSectionRegister(
//       {Key? key,
//       required this.onTap,
//       required this.ctrusername,
//       required this.ctremail,
//       required this.ctrpassword})
//       : super(key: key);
//   final TextEditingController ctrusername;
//   final TextEditingController ctremail;
//   final TextEditingController ctrpassword;
//   final Function() onTap;

//   @override
//   State<FormSectionRegister> createState() => _FormSectionRegisterState();
// }

// class _FormSectionRegisterState extends State<FormSectionRegister> {
//   String errorText = "";
//   bool isSaw = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text("Username", style: Styles.txt14medium),
//           const Gap(16),
//           shareWidget().textboxOutline(
//               "Insert Username", false, TextInputType.text, widget.ctrusername),
//           const Gap(16),
//           Text("Email Adress", style: Styles.txt14medium),
//           const Gap(16),
//           shareWidget().textboxOutline("Insert Email Adress", false,
//               TextInputType.text, widget.ctremail),
//           const Gap(16),
//           Text("Password", style: Styles.txt14medium),
//           const Gap(16),
//           TextField(
//             controller: widget.ctrpassword,
//             obscureText: isSaw ? false : true,
//             keyboardType: TextInputType.text,
//             cursorColor: Styles.AY600,
//             style: Styles.txt12medium,
//             decoration: InputDecoration(
//               suffixIcon: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isSaw = !isSaw;
//                   });
//                 },
//                 child: Icon(isSaw ? Icons.visibility : Icons.visibility_off,
//                     color: Styles.black),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Styles.AY600, width: 2.0),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
//               hintText: "Insert Passwod",
//               hintStyle: Styles.txt12regular.copyWith(color: Styles.greytxt),
//             ),
//           ),
//         ]),
//         Gap(32),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "By signing up, you’re agree to our ",
//               style: Styles.txt14regular,
//             ),
//             Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(
//                           context, PrivacyPolicyScreen.routeName);
//                     },
//                     child: Text("Terms & Conditions ",
//                         style:
//                             Styles.txt14regular.copyWith(color: Styles.AY600))),
//                 Text(
//                   "and ",
//                   style: Styles.txt14regular,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(
//                           context, PrivacyPolicyScreen.routeName);
//                     },
//                     child: Text("Privacy Policy",
//                         style:
//                             Styles.txt14regular.copyWith(color: Styles.AY600))),
//               ],
//             )
//           ],
//         ),
//         const Gap(40),
//         shareWidget().buttonFilled(
//             "Register",
//             widget.onTap,
//             Styles.txt20medium.copyWith(color: Styles.white),
//             double.infinity,
//             50,
//             0,
//             0),
//         const Gap(16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Already have an account? ",
//               style: Styles.txt14regular,
//             ),
//             GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, LoginScreen.routeName);
//                 },
//                 child: Text("Login",
//                     style: Styles.txt14regular.copyWith(color: Styles.AY600))),
//           ],
//         )
//       ],
//     );
//   }
// }
