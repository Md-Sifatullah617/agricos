import 'package:agricos/screens/login_screen.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomScreenPage extends StatelessWidget {
  const WelcomScreenPage({super.key});

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
                height: 330.h,
                width: 300.w,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 85.h,
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
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
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
        ));
  }
}
