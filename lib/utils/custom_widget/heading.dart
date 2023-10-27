import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  final bool? title;
  final double? logoPosition;
  final bool? needChange;
  const Heading({
    super.key,
    this.title,
    this.logoPosition,
    this.needChange = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            needChange!
                ? 'assets/images/Group 4.png'
                : 'assets/images/Group 3.png',
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
                    fontSize: 20.sp,
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
