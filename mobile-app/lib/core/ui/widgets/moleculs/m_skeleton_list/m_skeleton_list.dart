import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../../atoms/skeleton/a_skeleton.dart';

// ignore: must_be_immutable
class MSkeletonList extends StatelessWidget {
  Widget? child;
  Widget? skeleton;
  bool isLoading;
  EdgeInsets? padding;
  int crossAxisCount;
  double? mainAxisSpacing;
  double? crossAxisSpacing;
  double? mainAxisExtent;
  SliverGridDelegate? delegate;
  int numberOfItems;

  MSkeletonList(
      {Key? key,
      this.child,
      this.skeleton,
      required this.isLoading,
      this.padding,
      this.crossAxisCount = 1,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      this.mainAxisExtent,
      this.delegate,
      this.numberOfItems = 8})
      : super(key: key) {
    isLoading = isLoading;
    child = child;
    mainAxisSpacing = mainAxisSpacing ?? AppSizes.margin;
    crossAxisSpacing = crossAxisSpacing ?? AppSizes.margin;
    mainAxisExtent = mainAxisExtent ?? 20.h;
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child!;
    }

    return ASkeleton(
      isLoading: true,
      child: GridView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          gridDelegate: delegate ??
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing!,
                crossAxisSpacing: crossAxisSpacing!,
                mainAxisExtent: mainAxisExtent,
              ),
          children: Iterable<int>.generate(numberOfItems)
              .toList()
              .map((e) =>
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: skeleton ??
                    Container(
                      height: 80,
                      width: Get.width,
                      color: AppColors.gray,
                    ),
                  ))
              .toList()),
    );
  }
}
