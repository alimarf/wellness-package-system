import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../gap/a_gap.dart';

typedef OnRadioValue = dynamic Function(Object value);
typedef OnRadioChanged = dynamic Function(Object? value);

// ignore: must_be_immutable
class ARadioButton extends StatelessWidget {
  ARadioButton(
      {Key? key,
      required this.onValue,
      required this.groupValue,
      this.onRadioChanged,
      this.padding,
      this.fillColor,
      this.backgroundColor,
      this.borderColor,
      this.content})
      : super(key: key) {
    fillColor = fillColor ?? AppColors.primary;
    backgroundColor = backgroundColor ?? AppColors.white;
  }

  Object groupValue;
  Object onValue;
  OnRadioChanged? onRadioChanged;
  EdgeInsetsGeometry? padding;
  Color? fillColor;
  Color? backgroundColor;
  Color? borderColor;
  Widget? content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onRadioChanged?.call(onValue);
      },
      child: Row(
        children: [
          Theme(
            data: ThemeData(
                radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith((states) =>
                  onValue == groupValue ? AppColors.primary : AppColors.black),
            )),
            child: SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                value: onValue,
                groupValue: groupValue,
                onChanged: onRadioChanged,
              ),
            ),
          ),
          if (content != null)
            Row(
              children: [AGap(width: 10), content!],
            )
        ],
      ),
    );
  }
}
