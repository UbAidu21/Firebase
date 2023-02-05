import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    required this.hint,
    this.label,
    this.validator,
    this.textInputType,
    this.maxLines,
  });

  TextEditingController controller;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hint;
  String? label;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        label: AppText(
          text: label ?? '',
          // maxLines: maxLines,
        ),
      ),
    );
  }
}
