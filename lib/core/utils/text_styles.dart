import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

TextStyle getHeadlineStyle({double fontsize = 18}) {
  return TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: fontsize,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getTitleStyle({Color color = Colors.black, double fontSize = 18}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getSubTitleStyle(
    {double fontsize = 16, Color color = AppColors.black}) {
  return TextStyle(
    fontSize: fontsize,
    color: color,
  );
}

TextStyle getSmallTextStyle(
    {double fontSize = 14, Color color = AppColors.ashGray}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
  );
}
