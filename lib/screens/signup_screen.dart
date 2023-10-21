import 'package:agricos/screens/otp_code.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/outline_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(),
          Image.asset(
            'assets/images/Group 3.png',
            width: 360.w,
            fit: BoxFit.fitWidth,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomText(
                text: 'Create Account',
                fontSize: 30.sp,
                txtAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              OutlinetxtField(
                hinttxt: 'Full Name',
                suffixicon: Image.asset(
                  'assets/icons/Vector.png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 20.h),
              OutlinetxtField(
                hinttxt: 'Email Address',
                suffixicon: Image.asset(
                  'assets/icons/Vector (1).png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 20.h),
              OutlinetxtField(
                hinttxt: 'Phone Number',
                suffixicon: Image.asset(
                  'assets/icons/Vector (2).png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 20.h),
              OutlinetxtField(
                hinttxt: 'Password',
                suffixicon: Image.asset(
                  'assets/icons/Vector (3).png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 20.h),
              OutlinetxtField(
                hinttxt: 'Confirm Password',
                suffixicon: Image.asset(
                  'assets/icons/Vector (4).png',
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              SizedBox(height: 80.h),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpCodeScreen()));
                },
                child: Container(
                    width: 300.w,
                    height: 41.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF89EE51),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Next',
                            fontSize: 20.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                            'assets/icons/Vector (5).png',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )),
              )
            ]),
          ))
        ],
      ),
    );
  }
}
