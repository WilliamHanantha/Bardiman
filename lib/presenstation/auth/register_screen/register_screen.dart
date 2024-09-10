import 'package:bardimannn/data/data_sources/auth_local_datasource.dart';
import 'package:bardimannn/data/models/register_response_model.dart';
import 'package:bardimannn/presenstation/auth/bloc/register/register_bloc.dart';
import 'package:bardimannn/presenstation/auth/register_screen/components/form_section.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/header_section.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController ctrusername = new TextEditingController();
  TextEditingController ctremail = new TextEditingController();
  TextEditingController ctrpassword = new TextEditingController();
  TextEditingController ctrphone = new TextEditingController();
  TextEditingController ctrgender = new TextEditingController();
  TextEditingController ctrdate = new TextEditingController();
  TextEditingController ctrmonth = new TextEditingController();
  TextEditingController ctryear = new TextEditingController();
  bool isLoading = false;
  bool isLoaded = false;

  // void getUser() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("token") ?? "";
  //   var response = await AuthService().getUserDetail(token);
  //   if (response.error == null) {
  //     setState(() {
  //       userDetail = response.data as UserDetailModel;
  //       isLoaded = true;
  //       Navigator.pushNamed(context, BottomNavigation.routeName);
  //     });
  //     postPromo();
  //     print(userDetail!.success!
  //         .username); // Now it's safe to call postPromo after userDetail is set.
  //   } else {
  //     setState(() {
  //       isLoaded = false;
  //     });
  //   }
  // }

  // void postPromo() async {
  //   final url = Uri.parse("${Variables.baseUrl}api/promo/add");

  //   // Create the request body
  //   final Map<String, dynamic> requestBody = {
  //     'user_id': userDetail!.success!.id.toString(),
  //     'promo_code': "First Order",
  //     'promo_value': "15",
  //     'promo_desc':
  //         "• Discount 15%\n• Pay with any payment method\n• Maximum 5K",
  //     'menu_id': '0',
  //     // Add more fields as necessary
  //   };
  //   // Make the POST request
  //   final response = await http.post(url, body: requestBody);

  //   // Handle the response
  //   if (response.statusCode == 200) {
  //     print('POST Data Promotion request was successful.');
  //     print('Response: ${requestBody}');
  //   } else {
  //     print('POST Data Promotion request failed.');
  //     print('Status code: ${response.statusCode}');
  //     print('Response: ${requestBody}');
  //   }

  //   // Define the API endpoint URL
  // }

  // // POST API
  // postData() async {
  //   if (ctrusername.text.isNotEmpty &&
  //       ctremail.text.isNotEmpty &&
  //       ctrpassword.text.isNotEmpty) {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     var response = await AuthService().register(
  //         username: ctrusername.text,
  //         email: ctremail.text,
  //         password: ctrpassword.text);

  //     print(response.error);
  //     if (response.error == null) {
  //       setState(() {
  //         user = response.data as UserModelRegister;
  //       });
  //       if (user?.success == true) {
  //         SharedPreferences pref = await SharedPreferences.getInstance();
  //         pref.setString('token', user!.data.token);
  //         getUser();
  //       } else {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text("Email sudah terdaftar")));
  //       }
  //       //pindah page
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("Terjadi Kesalahan")));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Isi Semua Kolom dengan benar")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: isLoading
            ? null
            : AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
                backgroundColor: White,
              ),
        resizeToAvoidBottomInset: true,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24)
                        .copyWith(top: 32, bottom: 24),
                    child: Column(
                      children: [
                        const HeaderRegister(),
                        const Gap(40),
                        BlocListener<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              success: (registerResponseModel) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigation(),
                                  ),
                                );
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)));
                              },
                            );
                          },
                          child: BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return FormSectionRegister(
                                    ctremail: ctremail,
                                    ctrpassword: ctrpassword,
                                    ctrusername: ctrusername,
                                    ctrphone: ctrphone,
                                    ctrgender: ctrgender,
                                    ctrdate: ctrdate,
                                    ctrmonth: ctrmonth,
                                    ctryear: ctryear,
                                    onTap: () {
                                      context.read<RegisterBloc>().add(
                                          RegisterEvent.register(
                                              email: ctremail.text,
                                              password: ctrpassword.text,
                                              username: ctrusername.text));
                                    },
                                  );
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
      ),
    );
  }
}
