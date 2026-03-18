import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AContainer extends StatelessWidget {
  Widget? child;
  double? height;
  double? width;
  Alignment? alignment;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color? color;
  BoxDecoration? decoration;

  AContainer(
      {Key? key,
      this.child,
      this.height,
      this.width,
      this.alignment,
      this.margin,
      this.padding,
      this.color,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      padding: padding,
      color: color,
      decoration: decoration,
    );
  }
}
