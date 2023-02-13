import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({
    required this.text,
    required this.onPressed,
    this.height,
    this.minWidth,
    this.borderRadius,
    this.elevation,
    this.loading = false,
    super.key,
  });

  String text;
  double? height;
  double? minWidth;
  VoidCallback onPressed;
  double? elevation;
  double? borderRadius;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: height,
      color: Colors.teal,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      elevation: elevation,
      child: loading
          ?const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : AppText(
              text: text,
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
    );
  }
}
