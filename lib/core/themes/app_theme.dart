import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme(String languageCode) {
    final isArabic = languageCode == "ar";
    final lightTheme = ThemeData(
      fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.titlColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
        ),
      ),
      tabBarTheme: TabBarThemeData(
        tabAlignment: TabAlignment.start,
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.labelColor,
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
        indicatorColor: AppColors.darkPrimary,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        fillColor: AppColors.whiteColor,
        filled: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: AppColors.labelColor,
          fontSize: 16,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
          fontStyle: FontStyle.italic,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.labelColor,
          fontSize: 16,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
        ),
        errorStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
          foregroundColor: WidgetStateProperty.all(AppColors.whiteColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          side: WidgetStateProperty.all(
            BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.titlColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: AppColors.titlColor,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.titlColor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.titlColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.blackColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.iconColor,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.labelColor,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.labelColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.iconColor,
        unselectedItemColor: AppColors.darkGreyColor,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 27),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
          color: AppColors.titlColor,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: isArabic ? "Tajawal" : "PlusJakartaSans",
          color: AppColors.titlColor,
        ),
      ),
    );
    return lightTheme;
  }
}
