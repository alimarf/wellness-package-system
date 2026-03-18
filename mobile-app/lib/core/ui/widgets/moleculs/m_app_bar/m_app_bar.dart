import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../colors/colors.dart';
import '../../../constants/sizes.dart';
import '../../atoms/button/a_ghost_button.dart';
import '../../atoms/gap/a_gap.dart';
import '../../atoms/gesture_detector/a_gesture_detector.dart';

// ignore: must_be_immutable
class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget title;
  Widget? leading;
  List<Widget>? actions;
  bool? centerTitle;
  double height;
  Color? backgroundColor;
  Color? iconColor;
  IconThemeData? iconTheme;
  bool? showLocalizationToggle;
  bool? showDarkToggle;
  double? elevation;

  MAppBar(
      {Key? key,
      required this.title,
      this.leading,
      this.actions,
      this.centerTitle = true,
      this.height = 60,
      this.backgroundColor,
      this.iconColor,
      this.iconTheme,
      this.showDarkToggle = false,
      this.showLocalizationToggle = false,
      this.elevation = 0})
      : super(key: key) {
    if (leading == null &&
        (Get.previousRoute.isNotEmpty ||
            Get.currentRoute == Get.previousRoute)) {
      leading = AGestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onTap: () {
            Get.back();
          });
    }

    backgroundColor = backgroundColor ?? AppColors.primary.shade800;
    iconColor = iconColor ?? AppColors.primary;
  }

  static MAppBar white(
      {required String title, Widget? leading, List<Widget>? actions}) {

    return MAppBar(
        backgroundColor: Get.isDarkMode ? AppColors.black.shade500 : AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color:  Get.isDarkMode ? AppColors.white : AppColors.black),
        iconColor: Get.isDarkMode ? AppColors.white : AppColors.black,
        leading: leading,
        actions: actions,
        title: Text(
          title,
          style: Get.context?.textTheme.bodyLarge
              ?.copyWith(color: Get.isDarkMode ? AppColors.white : AppColors.black, fontWeight: FontWeight.bold),
        ));
  }

  static MAppBar primary({required String title}) {
    return MAppBar(
        backgroundColor: AppColors.primary.shade700,
        iconColor: AppColors.white,
        elevation: 0,
        title: Text(
          title,
          style: Get.context?.textTheme.bodyLarge
              ?.copyWith(color: AppColors.white),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: iconColor),
      elevation: elevation,
      foregroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      actions: [
        if (actions != null) ...actions!,
        if (showLocalizationToggle == true)
          AGhostButton(
              text: Get.locale!.languageCode,
              width: 50,
              onClick: () => Get.updateLocale(
                  Locale(Get.locale!.languageCode == 'en' ? 'id' : 'en'))),
        if (showDarkToggle == true)
          AGhostButton(
              prefixIcon:
                  context.theme.scaffoldBackgroundColor == AppColors.black
                      ? Icon(
                          Icons.sunny,
                          color: AppColors.gray,
                        )
                      : Icon(
                          Icons.mode_night,
                          color: AppColors.gray,
                        ),
              width: 50,
              onClick: () => Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)),
        AGap(
          width: AppSizes.padding,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
