import 'package:agricos/controller/auth_controller.dart';
import 'package:agricos/screens/after_login_page.dart';
import 'package:agricos/screens/login_screen.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomScreenPage extends StatelessWidget {
  WelcomScreenPage({super.key});
  final AuthService controller = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          const Heading(
            title: true,
          ),
          Positioned(
            top: 205.h,
            child: Image.asset(
              'assets/images/Man in paddy field green farming 1.png',
              height: 320.h,
              width: 280.w,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: 90.h,
            child: Text(
              'Without Agriculture we\ncan’t survive on this planet',
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.green.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await controller.isLoggedIn()
                  ? Get.to(() => const AfterLoginPage())
                  : Get.to(() => const LoginPage());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 20.h,
                  child: Image.asset(
                    'assets/images/Rectangle 1.png',
                  ),
                ),
                Positioned(
                  bottom: 33.h,
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
