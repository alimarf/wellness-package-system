import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ACenter extends StatelessWidget {
  Widget child;

  ACenter({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}
