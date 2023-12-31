import 'package:agricos/controller/auth_controller.dart';
import 'package:agricos/screens/signup_screen.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/custom_toast.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/custom_widget/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final AuthService controller = Get.find<AuthService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.center, children: [
        Container(),
        Heading(
          logoPosition: 5.h,
        ),
        Positioned(
          top: 180.h,
          child: Image.asset(
            'assets/images/Leonardo_Diffusion_one_person_doing_work_in_agriculture_field_1 1.png',
            height: 380.h,
            width: 300.w,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 200.h,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            width: 300.w,
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/sifat.jpg',
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  txtController: emailController,
                  hintTxt: 'Enter your email',
                  icondata: Icons.email_outlined,
                  // suffixicon: Icons.remove_red_eye,
                ),
                SizedBox(height: 10.h),
                CustomTextFormField(
                  txtController: pwdController,
                  hintTxt: 'Password',
                  icondata: Icons.lock_outline_rounded,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: 'Forgot Password?',
                    txtColor: Colors.white,
                    fontSize: 13.sp,
                    fontweight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Don’t have an account?',
                      txtColor: Colors.white,
                      fontSize: 11.sp,
                      fontweight: FontWeight.normal,
                    ),
                    SizedBox(width: 5.w),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: CustomText(
                        text: 'Sign Up',
                        txtColor: Colors.lightGreenAccent,
                        fontSize: 11.sp,
                        fontweight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'Or Sign in with',
                  txtColor: Colors.white,
                  fontSize: 11.sp,
                  fontweight: FontWeight.normal,
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.facebook_box,
                      iconSize: 25.sp,
                      iconColor: Colors.blue,
                      link: '',
                    ),
                    InkWell(
                      onTap: () {
                        controller.googleSignIn();
                      },
                      child: SocialWidget(
                        placeholderText: '',
                        iconData: FontAwesomeIcons.google,
                        iconSize: 25.sp,
                        iconColor: Colors.red,
                        link: '',
                      ),
                    ),
                    SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.twitter,
                      iconSize: 25.sp,
                      iconColor: Colors.blue,
                      link: '',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 80.h,
            child: Obx(
              () => controller.isLoading.value
                  ? SpinKitThreeBounce(
                      color: Colors.lightGreenAccent.shade700,
                      size: 20.sp,
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (emailController.text.isEmpty ||
                            pwdController.text.isEmpty) {
                          customToast(
                              msg: 'Please fill all the fields', isError: true);
                        } else if (!emailController.text.contains('@')) {
                          customToast(
                              msg: 'Please enter valid email', isError: true);
                        } else if (pwdController.text.length < 6) {
                          customToast(
                              msg: 'Password must be 6 characters long',
                              isError: true);
                        } else {
                          controller.firebaseLogIN(
                              email: emailController.text,
                              password: pwdController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        minimumSize: Size(150.w, 40.h),
                      ),
                      child: const CustomText(
                        text: 'Login',
                      )),
            )),
        Positioned(
            left: 25.w,
            bottom: 25.h,
            child: Image.asset(
              'assets/images/Rectangle 4.png',
              alignment: Alignment.center,
            )),
        Positioned(
            left: 75.w,
            bottom: 35.h,
            child: Transform.rotate(
              angle: 1.2,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
              ),
            )),
        Positioned(
            left: 35.w,
            bottom: 30.h,
            child: Text(
              "LAN",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            )),
      ]),
    );
  }
}
