import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AStack extends StatelessWidget {
  List<Widget> children;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;

  AStack({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children,
    );
  }
}
