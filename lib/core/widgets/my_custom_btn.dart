import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final double width;
  final double hight;
  final Function() onPressed;
  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, hight),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
