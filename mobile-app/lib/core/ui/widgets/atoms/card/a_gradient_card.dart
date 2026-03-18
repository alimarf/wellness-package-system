import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';

class AGradientCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;

  const AGradientCard({Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  State<AGradientCard> createState() => _AGradientCardState();
}

class _AGradientCardState extends State<AGradientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 80,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(
                  0,
                  4,
                ),
                blurRadius: 4)
          ],
          gradient: const LinearGradient(
              colors: [Color(0xFF3D1EFF), Color(0xFF30B4FF)])),
      child: Center(
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.white),
          child: widget.child
        ),
      ),
    );
  }
}
