import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/ui/colors/colors.dart';
import '../../../../../core/ui/constants/sizes.dart';
import '../../../../../core/ui/widgets/atoms/loading/a_loading.dart';
import '../../../../../core/ui/widgets/atoms/gap/a_gap.dart';
import '../../../../../core/values/state/app_state.dart';
import '../../domain/entities/package/package.entity.dart';
import '../widgets/moleculs/m_package_card.dart';
import 'package_list_controller.dart';

class PackageListView extends GetView<PackageListController> {
  const PackageListView({Key? key}) : super(key: key);

  static const _gridBackgroundColor = Color(0xFFF8F9FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _gridBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AGap(height: 24),
            Text(
              'Packages',
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.neutral[900],
              ),
            ),
            AGap(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.state.value == AppState.Loading) {
                  return Center(child: ALoading());
                }
                if (controller.packages.isEmpty) {
                  return Center(
                    child: Text(
                      'No packages available',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.neutral[600],
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: controller.packages.length,
                  itemBuilder: (context, index) {
                    return MPackageCard(
                        package: controller.packages[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
