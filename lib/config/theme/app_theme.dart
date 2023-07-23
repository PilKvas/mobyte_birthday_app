import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday_app/constants/app_colors.dart';

ThemeData birthdayTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: AppColors.sliderText,
        fontSize: (ScreenUtil().screenWidth < 600) ? 24.sp : 55.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: AppColors.headlineText,
        fontSize: (ScreenUtil().screenWidth < 600) ? 14.sp : 25.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: (ScreenUtil().screenWidth < 600) ? 24.sp : 60.sp,
        fontFamily: 'YesevaOne',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: AppColors.titleSmall,
        fontSize: (ScreenUtil().screenWidth < 600) ? 14.sp : 35.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: AppColors.collapse,
        fontSize: (ScreenUtil().screenWidth < 600) ? 14.sp : 25.sp,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: (ScreenUtil().screenWidth < 600) ? 14.sp : 30.sp,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 17.h,
        ),
        backgroundColor: AppColors.homePageButton,
      ),
    ),
  );
}

class ListTileCustomTheme {
  static TextStyle listTileStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        );
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          color: AppColors.listTileCaption,
          decoration: TextDecoration.none,
        );
  }
}
