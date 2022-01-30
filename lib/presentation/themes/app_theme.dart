import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  static ThemeData get() {
    const primaryLightColor = Color(0xFFF1E6FF);
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.r),
        borderSide: BorderSide(color: primaryLightColor, width: 0.4.w));
    const primaryColor = Color(0xFF6F35A5);
    

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      primaryColorLight: primaryLightColor,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.sp, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.sp, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 14.sp, fontFamily: 'roboto_bold'),
        bodyText2: TextStyle(fontSize: 14.sp, fontFamily: 'roboto_regular'),
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          disabledBorder: border,
          labelStyle: TextStyle(fontSize: 14.sp)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
    );

    
  }
}