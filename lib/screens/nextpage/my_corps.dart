import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCorpsPage extends StatelessWidget {
  const MyCorpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Heading(),
          Positioned.fill(
            top: 250.h,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...List.generate(
                  myCorpsSection.length,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(myCorpsSection[index]['navigate']);
                    },
                    child: Container(
                      width: 150.w,
                      height: 80.h,
                      margin: EdgeInsets.all(10.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CustomText(
                        text: myCorpsSection[index]['title'],
                        fontSize: 17.sp,
                        txtAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
