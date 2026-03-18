import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';

// ignore: must_be_immutable
class ABottomSheet extends StatelessWidget {
  Widget child;
  double? initialChildSize;
  double? minChildSize;
  double? maxChildSize;
  Color? backgroundColor;
  double? borderRadius;
  double? paddingTop;

  ABottomSheet({
    Key? key,
    required this.child,
    this.maxChildSize = 1,
    this.minChildSize = 0,
    this.initialChildSize = 0.3,
    this.paddingTop = 30,
    this.backgroundColor,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: minChildSize!,
      maxChildSize: maxChildSize!,
      initialChildSize: initialChildSize!,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: backgroundColor ?? (Get.isDarkMode ? AppColors.black : AppColors.white),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius!),
                  topRight: Radius.circular(borderRadius!)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    spreadRadius: 2)
              ]),
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: paddingTop,
                        ),
                        child
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
