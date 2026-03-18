import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ASizedBox extends StatelessWidget {
  Widget? child;
  double? height;
  double? width;

  ASizedBox({Key? key, this.child, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: child, height: height, width: width);
  }
}
