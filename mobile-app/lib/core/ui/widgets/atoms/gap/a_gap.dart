import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AGap extends StatelessWidget {
  double? height;
  double? width;

  AGap({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
