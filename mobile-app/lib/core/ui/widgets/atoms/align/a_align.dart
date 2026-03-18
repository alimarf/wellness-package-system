import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AAlign extends StatelessWidget {
  Widget child;
  Alignment alignment;

  AAlign({Key? key, required this.child, this.alignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: child,
      alignment: alignment,
    );
  }
}
