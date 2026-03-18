import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ASingleChildScrollView extends StatelessWidget {
  Widget child;
  EdgeInsets? padding;

  ASingleChildScrollView({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: child,
      padding: padding ?? EdgeInsets.zero,
    );
  }
}
