import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinetxtField extends StatelessWidget {
  final TextEditingController? textController;
  final String? hinttxt;
  final Widget? suffixicon;

  const OutlinetxtField({
    super.key,
    this.textController,
    this.hinttxt,
    this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFCFC),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF31F820)),
          borderRadius: BorderRadius.circular(26),
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
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 7.h, left: 20.w, bottom: 10.h, right: 5.w),
          hintText: hinttxt,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: Colors.black,
          ),
          suffixIcon: suffixicon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
