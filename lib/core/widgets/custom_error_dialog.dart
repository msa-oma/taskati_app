import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

showErrorDialog(context, texti) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(texti),
    backgroundColor: AppColors.pinkishRed,
  ));
}
