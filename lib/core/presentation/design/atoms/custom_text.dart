import 'package:order_360/core/presentation/design/tokens/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final bool? isTitle;

  const CustomText(
    this.text, {
    Key? key,
    this.textColor,
    this.fontWeight = FontWeight.w400,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 16,
    this.overflow,
    this.height = 1,
    this.isTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
      overflow: overflow,
      style: TextStyle(
          color: textColor ?? colors.textColor,
          fontFamily: isTitle! ? "Poppins" : "Roboto",
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          decoration: textDecoration),
    );
  }
}
