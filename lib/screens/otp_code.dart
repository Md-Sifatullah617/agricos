import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

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
          const Positioned(
              child: CustomText(
            text: 'Verify Phone',
            isUnderline: true,
          ))
        ],
      ),
    );
  }
}
