import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

TextStyle getHeadlineStyle({double fontsize = 18}) {
  return TextStyle(
      fontSize: fontsize,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.aBeeZee().fontFamily);
}

TextStyle getBodyStyle(
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getTitleStyle({
  Color color = const Color(0xff4E5AE8),
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getSubTitleStyle(
    {double fontsize = 16, Color color = AppColors.black}) {
  return TextStyle(
    fontSize: fontsize,
    color: color,
  );
}

TextStyle getSmallTextStyle({
  double fontSize = 14,
  Color color = AppColors.ashGray,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
