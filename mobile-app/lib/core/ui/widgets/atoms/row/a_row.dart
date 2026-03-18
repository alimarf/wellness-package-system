import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ARow extends StatelessWidget {
  List<Widget> children;
  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment mainAxisAlignment;

  ARow({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}
