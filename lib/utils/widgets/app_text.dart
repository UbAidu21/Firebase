import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  AppText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    super.key,
  });

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
