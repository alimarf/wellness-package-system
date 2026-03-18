import 'package:flutter/material.dart';

class AExpanded extends StatelessWidget {
  final bool shouldExpand;
  final Widget child;

  AExpanded({this.shouldExpand = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return shouldExpand
        ? Expanded(
            child: child,
          )
        : Container(
            child: child,
          );
  }
}
