import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agricos',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: const WelcomScreenPage(),
      ),
    );
  }
}
