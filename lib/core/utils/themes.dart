import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/text_styles.dart';

//---------------------light mode-----------------\\

final ThemeData lightTheme = ThemeData(
//colors
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,

//font
  fontFamily: GoogleFonts.poppins().fontFamily,

//textTheme
  textTheme: TextTheme(
    displayLarge: getHeadlineStyle(),
    displayMedium: getTitleStyle(color: AppColors.black),
    bodyMedium: getBodyStyle(),
    titleSmall: getSmallTextStyle(),
    displaySmall: getSmallTextStyle(color: AppColors.white),
  ),
  // datePickerTheme: const DatePickerThemeData(
  //   headerBackgroundColor: AppColors.primaryColor,
  //   rangeSelectionBackgroundColor: AppColors.primaryColor,
  //   rangePickerHeaderForegroundColor: AppColors.jetBlack,
  //   backgroundColor: Colors.white,
  // ),
// button text color
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: AppColors.primaryColor,
  )),
  iconTheme: const IconThemeData(color: AppColors.primaryColor),
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
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      hintStyle: getSmallTextStyle(),
      iconColor: AppColors.primaryColor,
      suffixIconColor: AppColors.primaryColor,
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
  //colors
  scaffoldBackgroundColor: AppColors.jetBlack,
  primaryColor: AppColors.white,

  //font
  fontFamily: GoogleFonts.poppins().fontFamily,

  // app Bar Theme
  appBarTheme: AppBarTheme(
      titleTextStyle: getHeadlineStyle(),
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0),

  //textTheme
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: AppColors.ashGray), //make it black
    displayMedium: getSubTitleStyle(color: AppColors.ashGray), //make it black
    displaySmall: getSmallTextStyle(),
  ),
//Date Picker Theme
  datePickerTheme: DatePickerThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.ashGray)),
    rangePickerHeaderBackgroundColor: AppColors.ashGray,
    headerForegroundColor: AppColors.ashGray,
    rangeSelectionBackgroundColor: AppColors.primaryColor,
    rangePickerHeaderForegroundColor: AppColors.jetBlack,
    yearForegroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
    weekdayStyle: getSmallTextStyle(color: AppColors.primaryColor),
    todayForegroundColor: const MaterialStatePropertyAll(AppColors.ashGray),
    dayForegroundColor: const MaterialStatePropertyAll(AppColors.ashGray),
    backgroundColor: AppColors.jetBlack,
  ),
//time Picker
  timePickerTheme: TimePickerThemeData(
    backgroundColor: AppColors.jetBlack,

    dayPeriodColor: AppColors.ashGray, //AM & PM
    dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? AppColors.white
            : Colors.blueGrey.shade800),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? AppColors.ashGray
            : Colors.blueGrey.shade800),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.white
            : AppColors.ashGray),
    dialHandColor: Colors.blueGrey.shade700,
    dialBackgroundColor: Colors.blueGrey.shade800,
    hourMinuteTextStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    dayPeriodTextStyle: //AM & PM
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    helpTextStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(0),
    ),
    dialTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected) ? Colors.white : Colors.grey),
    entryModeIconColor: AppColors.primaryColor,
  ),
// button text color
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryColor),

  //input decoration
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    iconColor: AppColors.primaryColor,
    suffixIconColor: AppColors.primaryColor,
    hintStyle: getSubTitleStyle(color: AppColors.ashGray),
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
        borderRadius: BorderRadius.circular(15)),
  ),
);
