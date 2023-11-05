import 'package:agricos/screens/login_screen.dart';
import 'package:agricos/screens/search_page.dart';
import 'package:agricos/utils/custom_widget/custom_text.dart';
import 'package:agricos/utils/custom_widget/heading.dart';
import 'package:agricos/utils/list.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final TextEditingController countryController = TextEditingController();
  String selectedCountry = '';

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
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())));
              },
              child: Image.asset(
                'assets/icons/Vector (6).png',
              ),
            ),
          ),
          //country picker here
          Positioned(
            top: 160.h,
            child: Container(
              height: 45.h,
              width: 300.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TextFormField(
                controller: countryController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Select State/Country',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        onSelect: (Country country) {
                          countryController.text = country.displayName;
                          print('Select country: ${country.displayName}');
                        },
                      );
                    },
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 50.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 220.h,
            child: Container(
              width: 300.w,
              height: 408.h,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.71,
                            crossAxisSpacing: 10.sp,
                            mainAxisSpacing: 10.sp),
                        itemCount: homeList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        homeList[index]['image'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: homeList[index]['name'],
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  text: 'Expert in:',
                                  txtColor: Colors.green,
                                  fontSize: 10.sp,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 5.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: homeList[index]['exp1'],
                                        fontSize: 10.sp,
                                        txtAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                homeList[index]['exp2'] == ''
                                    ? Container()
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 5.sp,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                            child: CustomText(
                                              text: homeList[index]['exp2'],
                                              fontSize: 10.sp,
                                              txtAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),

          Positioned(
              bottom: 20.h,
              child: Container(
                width: 320.w,
                height: 41.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/Vector (7).png',
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/Vector (8).png',
                          )),
                    ],
                  ),
                ),
              )),
          Positioned(
            bottom: 40.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.lightGreenAccent)),
                backgroundColor: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
              ),
              child: Icon(
                Icons.search,
                size: 30.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
