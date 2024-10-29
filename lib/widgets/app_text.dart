import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? size;
  final double? lineHeight;
  final FontWeight? weight;
  final Color? color;
  final TextStyle? style;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isTitle;
  final String? family;

  const AppText(this.text,
      {this.align,
      this.color,
      this.size,
      this.lineHeight,
      this.weight,
      this.decoration,
      this.overflow,
      this.style,
      this.maxLines,
      this.isTitle = false,
      this.family,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        maxLines: maxLines,
        overflow: overflow,
        style: style ??
            TextStyle(
                height: lineHeight,
                decoration: decoration,
                color: color,
                fontWeight: weight ?? FontWeight.w400,
                fontSize: size ?? (!isTitle ? 13.0 : 16.0)));
  }
}
