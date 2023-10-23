import 'package:agricos/screens/otp_code.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/custom_toast.dart';
import 'package:agricos/utils/custom_widget/outline_txt_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  String verificationId = "";
  Future<void> verifyPhoneNumber(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          print('verificationCompleted $authCredential');
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification failed: ${e.message}");
        },
        codeSent: (String verId, int? forceResendingToken) {
          setState(() {
            verificationId = verId;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpCodeScreen(
                phone: phoneController.text,
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verId) {
          setState(() {
            verificationId = verId;
          });
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      print(e);
    }
  }

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
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    customToast(msg: 'Password does not match', isError: true);
                  } else {
                    verifyPhoneNumber(context);
                  }
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
