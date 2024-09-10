import 'package:bardimannn/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/share.dart';
import '../splash_screen/splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // UserDetailModel user = UserDetailModel();
  bool isLoading = false;
  // void getUser() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("token") ?? "";
  //   var response = await AuthService().getUserDetail(token);
  //   if (response.error == null) {
  //     setState(() {
  //       user = response.data as UserDetailModel;
  //       isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   getUser();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AY500,
        elevation: 0,
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Profile",
          style: Fonts.appbarTitle,
        ),
      ),
      body: isLoading
          ? SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24)
                    .copyWith(top: 24),
                child: SkeletonProfile(),
              )),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Gap(24),
                    // HeaderProfileScreen(user: user.success!),
                    Gap(24),
                    // FreeCutProfileScreen(
                    //   user: user.success!,
                    // ),
                    Gap(44),
                    // BodyProfile(),
                    shareWidget().profileRow(() async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Warning'),
                          content: Text('Are you sure want to log out'),
                          actions: [
                            TextButton(
                              child: Text('No'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString("token", "");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                        Icon(
                          Icons.logout,
                          color: Black,
                          size: 24,
                        ),
                        "Logout"),
                    Gap(40),
                  ],
                ),
              ),
            ),
    );
  }
}

class SkeletonProfile extends StatelessWidget {
  const SkeletonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shareWidget().shimmerContainer(100, 100, 100),
            Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shareWidget().shimmerContainer(150, 30, 8),
                Gap(8),
                shareWidget().shimmerContainer(150, 20, 4),
                Gap(16),
                shareWidget().shimmerContainer(150, 35, 8),
              ],
            ),
            Spacer(),
            shareWidget().shimmerContainer(30, 30, 30),
          ],
        ),
        Gap(24),
        shareWidget().shimmerContainer(double.infinity, 100, 4),
        Gap(12),
        shareWidget().shimmerContainer(double.infinity, 40, 4),
        Gap(44),
        shareWidget().shimmerContainer(double.infinity, 40, 4),
        Gap(12),
        shareWidget().shimmerContainer(double.infinity, 40, 4),
        Gap(12),
        shareWidget().shimmerContainer(double.infinity, 40, 4),
        Gap(12),
        shareWidget().shimmerContainer(double.infinity, 40, 4),
      ],
    );
  }
}
