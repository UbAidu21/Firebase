import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  AppText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.fontFamily,
    this.fontStyle,
    super.key,
  });

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  int? maxLines;
  String? fontFamily;
  FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
      ),
    );
  }
}
