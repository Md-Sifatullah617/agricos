import 'package:agricos/controller/auth_controller.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/custom_toast.dart';
import 'package:agricos/utils/custom_widget/outline_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AuthService controller = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.isLoading.value) {
          controller.isLoading.value = false;
        }
        Get.back();
        return true;
      },
      child: Scaffold(
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Create Account',
                      fontSize: 30.sp,
                      txtAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    OutlinetxtField(
                      textController: nameController,
                      hinttxt: 'Full Name',
                      suffixicon: Image.asset(
                        'assets/icons/Vector.png',
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    OutlinetxtField(
                      textController: emailController,
                      hinttxt: 'Email Address',
                      suffixicon: Image.asset(
                        'assets/icons/Vector (1).png',
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    OutlinetxtField(
                      textController: phoneController,
                      hinttxt: 'Phone Number',
                      suffixicon: Image.asset(
                        'assets/icons/Vector (2).png',
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    OutlinetxtField(
                      textController: passwordController,
                      hinttxt: 'Password',
                      suffixicon: Image.asset(
                        'assets/icons/Vector (3).png',
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    OutlinetxtField(
                      textController: confirmPasswordController,
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
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty) {
                          customToast(
                              msg: 'Please fill all the fields', isError: true);
                        } else if (!emailController.text.contains('@')) {
                          customToast(
                              msg: 'Please enter valid email', isError: true);
                        } else if (phoneController.text.length == 11 &&
                            phoneController.text.substring(0, 2) != '01') {
                          customToast(
                              msg: 'Please enter valid phone number',
                              isError: true);
                        } else if (passwordController.text.length < 6) {
                          customToast(
                              msg: 'Password must be 6 characters long',
                              isError: true);
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          customToast(
                              msg: 'Password does not match', isError: true);
                        } else {
                          controller.sentOtp(
                              phone: phoneController.text,
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: Obx(
                        () => controller.isLoading.value
                            ? SpinKitThreeBounce(
                                color: Colors.lightGreenAccent.shade700,
                                size: 20.sp,
                              )
                            : Container(
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.asset(
                                        'assets/icons/Vector (5).png',
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    )
                  ]),
            ))
          ],
        ),
      ),
    );
  }
}
