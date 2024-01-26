import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/app_colors.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hintText;
  final IconButton? icon;
  final bool? readOnly;

  const CustomTextFormFild(
      {super.key, required this.hintText, this.icon, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.jetBlack),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.jetBlack),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
