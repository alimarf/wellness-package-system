import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../sized_box/a_sized_box.dart';

// ignore: must_be_immutable
class AppPageIndicator extends StatelessWidget {
  bool isActive;

  AppPageIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ASizedBox(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: AppColors.primary.withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? AppColors.primary : const Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}
