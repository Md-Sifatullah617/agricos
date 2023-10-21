import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? txtController;
  final String? hintTxt;
  final IconData? icondata;
  const CustomTextFormField({
    super.key,
    this.txtController,
    this.hintTxt,
    this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: txtController,
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 35),
        contentPadding: const EdgeInsets.only(bottom: -5),
        hintText: hintTxt,
        hintStyle: TextStyle(
          fontSize: 15.sp,
          color: Colors.white,
        ),
        prefixIcon: Icon(
          icondata,
          color: Colors.white,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
