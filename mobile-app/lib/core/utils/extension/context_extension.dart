import 'package:flutter/material.dart';

extension ContextExt on BuildContext {

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;
}