import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  AppText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
