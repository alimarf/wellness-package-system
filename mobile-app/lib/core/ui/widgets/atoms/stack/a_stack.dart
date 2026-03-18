import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AColumn extends StatelessWidget {
  List<Widget> children;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;

  AColumn({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}
