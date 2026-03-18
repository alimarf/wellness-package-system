import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AText extends StatelessWidget {
  String text;
  TextAlign? textAlign;
  TextStyle? style;
  TextOverflow? overflow;

  AText(this.text,
      {Key? key,
      this.textAlign = TextAlign.left,
      this.overflow = TextOverflow.ellipsis,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: style,
    );
  }
}
