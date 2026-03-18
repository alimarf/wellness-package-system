import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../colors/colors.dart';

class APlayButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPlay;
  const APlayButton({
    Key? key,
    required this.onTap,
    required this.isPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          isPlay ? LucideIcons.pause : LucideIcons.play,
          color: AppColors.white,
        ),
      ),
    );
  }
}
