import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';

final ThemeData lightTheme = ThemeData(
//colors
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,

//font
  fontFamily: GoogleFonts.poppins().fontFamily,

//textTheme
  textTheme: TextTheme(
    displayLarge: getTitleStyle(),
    displayMedium: getSubTitleStyle(),
    displaySmall: getSmallTextStyle(),
  ),
  //datePickerTheme
  // datePickerTheme: DatePickerThemeData(
  //   headerBackgroundColor: AppColors.primaryColor,
  //   rangeSelectionBackgroundColor: AppColors.primaryColor,
  //   rangePickerHeaderForegroundColor: AppColors.darkBg,
  //   backgroundColor: Colors.white,
  // ),

  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: AppColors.primaryColor,
  )), // button text color

  timePickerTheme: const TimePickerThemeData(),

  // app Bar Theme
  appBarTheme: AppBarTheme(
      titleTextStyle: getHeadlineStyle(),
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0),
  switchTheme: const SwitchThemeData(),
  //input decoration
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallTextStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.pinkishRed),
          borderRadius: BorderRadius.circular(15)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.pinkishRed),
          borderRadius: BorderRadius.circular(15))),
);

//---------------------dark mode-----------------\\
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.jetBlack,

  primaryColor: Colors.white,

  fontFamily: GoogleFonts.poppins().fontFamily,

  appBarTheme: AppBarTheme(
      titleTextStyle: getHeadlineStyle(),
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0),
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: Colors.white),
    displayMedium: getSubTitleStyle(color: Colors.white),
    displaySmall: getSmallTextStyle(),
  ),
  // datePickerTheme: DatePickerThemeData(
  //   headerBackgroundColor: AppColors.primaryColor,
  //   rangeSelectionBackgroundColor: AppColors.primaryColor,
  //   rangePickerHeaderForegroundColor: AppColors.lightBg,
  //   yearForegroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
  //   weekdayStyle: getSmallTextStyle(color: AppColors.primaryColor),
  //   todayForegroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
  //   dayForegroundColor: MaterialStatePropertyAll(AppColors.lightBg),

  //   backgroundColor: AppColors.darkBg,
  // ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor, // button text color
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallTextStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.pinkishRed),
          borderRadius: BorderRadius.circular(15)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.pinkishRed),
          borderRadius: BorderRadius.circular(15))),
);
