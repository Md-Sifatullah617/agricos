import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  final bool? title;
  final double? logoPosition;
  const Heading({
    super.key,
    this.title,
    this.logoPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/images/Group 3.png',
            width: 360.w,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: 75.h,
          child: title ?? false
              ? Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        Positioned(
          top: logoPosition ?? 25.h,
          child: Image.asset(
            'assets/images/logo.png',
            height: 220.h,
            width: 220.w,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
