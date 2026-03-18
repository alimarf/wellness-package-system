import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AClipRRect extends StatelessWidget {
  Widget child;
  BorderRadius borderRadius;

  AClipRRect({Key? key, required this.child, required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: child,
      borderRadius: borderRadius,
    );
  }
}
