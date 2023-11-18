import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontFamily,
      this.fontWeight,
      this.fontColor});

  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }
}
