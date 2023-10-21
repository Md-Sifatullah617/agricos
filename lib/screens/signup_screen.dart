import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(),
        Image.asset(
          'assets/images/Group 3.png',
          width: 360.w,
          fit: BoxFit.fitWidth,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Create Account',
                fontSize: 30.sp,
                txtAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
