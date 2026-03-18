// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class ALoading extends StatelessWidget {
  Color? color;

  ALoading({Key? key, this.color}) {
    color = color ?? AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
