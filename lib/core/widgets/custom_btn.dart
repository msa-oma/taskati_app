import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
      ), //u may want to add style
    );
  }
}
