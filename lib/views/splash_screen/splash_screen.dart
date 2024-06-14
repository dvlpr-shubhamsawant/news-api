import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/consts/app_info.dart';
import 'package:newsapp/consts/spacing.dart';
import 'package:newsapp/consts/typography.dart';
import 'package:newsapp/controller/home_controller.dart';
import 'package:newsapp/views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late HomeController controller;

  changeScreen(BuildContext context) async {
    await controller.fetchNews();
    GoRouter.of(context).goNamed(HomeScreen.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      controller = Provider.of<HomeController>(context, listen: false);
      changeScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppInfo.appLogo,
              height: 120.h,
            ),
            Spacing.heightBox(20.r),
            Text(
              "${AppInfo.appName}",
              style: TextStyle(fontSize: 22, fontFamily: Typo.bold),
            ),
            Spacing.heightBox(20.r),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
