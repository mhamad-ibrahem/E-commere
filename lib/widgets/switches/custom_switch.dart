import 'package:flutter/material.dart';

import '../../core/common/colors/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key, required this.value, this.activeColor, this.onChanged});
  final bool value;
  final Color? activeColor;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Switch(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: value,
      activeColor: activeColor ?? AppColors.primaryColor,
      inactiveThumbColor: AppColors().white,
      inactiveTrackColor: AppColors().grey,
      overlayColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return activeColor != null
            ? activeColor!.withOpacity(0.7)
            : AppColors.primaryColor.withOpacity(0.7);
      }),
      onChanged: onChanged,
    );
  }
}
