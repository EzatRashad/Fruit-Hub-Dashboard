import 'package:flutter/material.dart';
import 'package:frut_hub_dashboard/core/utils/app_colors.dart'; 

class AppTheme {
  static bool dTheme = false;
  static ThemeMode currentTheme = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    fontFamily: "cairo",
    scaffoldBackgroundColor: AppColors.white,
    //  primaryColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "cairo",
        color: AppColors.black,
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontFamily: "cairo",
        fontSize: 23,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontFamily: "cairo",
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: AppColors.gray150,
        fontWeight: FontWeight.w400,
        fontFamily: "cairo",
        fontSize: 14,
      ),
    ),
  );
  //-------------------------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    fontFamily: "cairo",
    scaffoldBackgroundColor: AppColors.black,
    //  primaryColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 19,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontFamily: "cairo",
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontFamily: "cairo",
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: AppColors.gray150,
        fontFamily: "cairo",
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
  );
}
