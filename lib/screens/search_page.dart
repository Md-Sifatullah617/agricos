import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          const Heading(
            needChange: true,
            logoPosition: -25,
          ),
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
              top: 160.h,
              child: Container(
                width: 300.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Search',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //search bar here
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 45.h,
                      width: 300.w,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: 'Vegetables crops expert',
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchList.length,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text:
                                            searchList[index]['exp'].toString(),
                                        fontSize: 15.sp,
                                        txtAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                      height: 80.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            searchList[index]['image']
                                                .toString(),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
