import 'package:agricos/screens/dashboard.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/custom_widget/outline_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfterLoginPage extends StatelessWidget {
  const AfterLoginPage({super.key});

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
            top: 220,
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
                      const OutlinetxtField(
                        hinttxt: 'Enter Your Crop Type',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Enter Your Soil Type',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Enter Your Climate',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Farm Size and layout',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Pest and disease',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Farming equipment',
                      ),
                      SizedBox(height: 10.h),
                      const OutlinetxtField(
                        hinttxt: 'Economic Information',
                      ),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashBoardScreen()));
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
