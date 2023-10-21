import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? txtColor;
  final double? fontSize;
  final FontWeight? fontweight;
  final TextAlign? txtAlign;
  const CustomText({
    super.key,
    this.text,
    this.txtColor,
    this.fontSize,
    this.fontweight,
    this.txtAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 20.sp,
        color: txtColor ?? Colors.black,
        fontWeight: fontweight ?? FontWeight.bold,
      ),
      textAlign: txtAlign ?? TextAlign.center,
    );
  }
}
