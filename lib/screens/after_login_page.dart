import 'package:agricos/screens/dashboard.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/custom_widget/outline_txt_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfterLoginPage extends StatelessWidget {
  AfterLoginPage({super.key});
  final TextEditingController cropController = TextEditingController();
  final TextEditingController soilController = TextEditingController();
  final TextEditingController climateController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController equipmentController = TextEditingController();
  final TextEditingController economicController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(),
        const Heading(),
        // Positioned(
        //   top: 130.h,
        //   left: 25.w,
        //   child: InkWell(
        //     onTap: () async {
        //       await FirebaseAuth.instance.signOut().then((value) =>
        //           Navigator.pushReplacement(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const LoginPage())));
        //     },
        //     child: Image.asset(
        //       'assets/icons/Vector (6).png',
        //     ),
        //   ),
        // ),
        Positioned(
            top: 190.h,
            child: Container(
                width: 300.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'Farming Details',
                        isUnderline: true,
                      ),
                      SizedBox(height: 20.h),
                      OutlinetxtField(
                        textController: cropController,
                        hinttxt: 'Enter Your Crop Type',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: soilController,
                        hinttxt: 'Enter Your Soil Type',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: climateController,
                        hinttxt: 'Enter Your Climate',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: sizeController,
                        hinttxt: 'Farm Size and layout',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: diseaseController,
                        hinttxt: 'Pest and disease',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: equipmentController,
                        hinttxt: 'Farming equipment',
                      ),
                      SizedBox(height: 10.h),
                      OutlinetxtField(
                        textController: economicController,
                        hinttxt: 'Economic Information',
                      ),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                          onPressed: () async {
                            //store data in firebase
                            await store
                                .collection('farming_details')
                                .doc(auth.currentUser!.uid)
                                .set({
                              'crop': cropController.text,
                              'soil': soilController.text,
                              'climate': climateController.text,
                              'size': sizeController.text,
                              'disease': diseaseController.text,
                              'equipment': equipmentController.text,
                              'economic': economicController.text,
                            }).then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoardScreen())));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            minimumSize: Size(250.w, 40.h),
                          ),
                          child: CustomText(
                            text: 'Submit',
                          ))
                    ]))),
      ],
    ));
  }
}
