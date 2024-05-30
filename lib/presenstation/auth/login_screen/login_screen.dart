import 'package:bardimannn/data/data_sources/auth_local_datasource.dart';
import 'package:bardimannn/presenstation/auth/bloc/login/login_bloc.dart';
import 'package:bardimannn/presenstation/auth/login_screen/components/form_section.dart';
import 'package:bardimannn/presenstation/auth/login_screen/components/header_section.dart';
import 'package:bardimannn/theme/theme.dart';
import 'package:bardimannn/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginscreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController ctremail = new TextEditingController();
  TextEditingController ctrpassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: White,
        ),
        resizeToAvoidBottomInset: true,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24)
                        .copyWith(top: 32),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeaderLogin(),
                        Gap(40),
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              success: (authResponseModel) {
                                AuthLocalDatasources()
                                    .saveAuthData(authResponseModel);
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
                                  SnackBar(
                                    content: Text(message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                          },
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return FormSectionLogin(
                                    ctremail: ctremail,
                                    ctrpassword: ctrpassword,
                                    onTap: () {
                                      context.read<LoginBloc>().add(
                                          LoginEvent.login(
                                              email: ctremail.text,
                                              password: ctrpassword.text));
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
                        )
                      ],
                    ))),
              ),
      ),
    );
  }
}
