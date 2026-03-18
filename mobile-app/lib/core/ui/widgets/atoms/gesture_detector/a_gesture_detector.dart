import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AGestureDetector extends StatelessWidget {
  Widget child;
  Function() onTap;

  AGestureDetector({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: onTap,
    );
  }
}
