import 'package:flutter/material.dart';

// ignore: must_be_immutable
class APadding extends StatelessWidget {
  Widget child;
  EdgeInsets padding;

  APadding({Key? key, required this.child, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: child,
      padding: padding,
    );
  }
}
