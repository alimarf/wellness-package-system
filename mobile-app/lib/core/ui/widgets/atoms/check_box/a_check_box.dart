import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../gap/a_gap.dart';

class ACheckBox extends StatelessWidget {
  const ACheckBox(
      {Key? key, this.onChanged, this.isSelected = false, this.content})
      : super(key: key);

  final bool isSelected;
  final ValueChanged<bool?>? onChanged;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateColor.resolveWith((states) =>
                    isSelected ? AppColors.primary : AppColors.white),
              ),
            ),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: isSelected,
              onChanged: onChanged,
            ),
          ),
        ),
        if (content != null)
          Row(
            children: [AGap(width: 10), content!],
          )
      ],
    );
  }
}
