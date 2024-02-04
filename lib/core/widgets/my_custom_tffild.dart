import 'package:flutter/material.dart';
import 'package:taskati_app/core/utils/text_styles.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hintText;
  final IconButton? icon;
  final bool? readOnly;
  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextFormFild(
      {super.key,
      required this.hintText,
      this.icon,
      this.readOnly,
      this.maxLines,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      style: getSubTitleStyle(color: Theme.of(context).primaryColor),
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
      ),
    );
  }
}
