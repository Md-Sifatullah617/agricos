import 'package:agricos/controller/auth_controller.dart';
import 'package:agricos/screens/after_login_page.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/custom_toast.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeScreen extends StatefulWidget {
  final String? phone;
  final String verificationId;
  final String email;
  final String password;
  const OtpCodeScreen(
      {super.key,
      this.phone,
      required this.verificationId,
      required this.email,
      required this.password});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          const Heading(),
          Positioned(
            top: 120.h,
            left: 25.w,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/Vector (6).png',
              ),
            ),
          ),
          Positioned(
              top: 240,
              child: Container(
                width: 300.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Verify Phone',
                      isUnderline: true,
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: 'Code sent to ${widget.phone}',
                      fontSize: 15.sp,
                      fontweight: FontWeight.normal,
                    ),
                    SizedBox(height: 20.h),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10.r),
                        fieldHeight: 50.h,
                        fieldWidth: 40.w,
                        inactiveFillColor: Colors.grey.shade300,
                        inactiveColor: Colors.black,
                        activeColor: Colors.black,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");

                        return true;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        CustomText(
                          text: 'Don’t receive the code?',
                          txtColor: Colors.black,
                          fontSize: 15.sp,
                          fontweight: FontWeight.normal,
                        ),
                        SizedBox(width: 5.w),
                        CustomText(
                          text: 'Request Again',
                          fontSize: 15.sp,
                        ),
                      ],
                    ),
                    CustomText(
                      text: 'Get Via Call',
                      fontSize: 15.sp,
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                        onPressed: () {
                          AuthService.signIn(
                              otp: currentText,
                              errorStep: (error) {
                                customToast(msg: error, isError: true);
                              },
                              nextStep: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AfterLoginPage()));
                              },
                              email: widget.email,
                              password: widget.password);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const AfterLoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          minimumSize: Size(280.w, 40.h),
                        ),
                        child: const CustomText(
                          text: 'Next',
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
