import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/colors/app_colors.dart';

class ResponsiveCheckboxWidget extends StatelessWidget {
  const ResponsiveCheckboxWidget(
      {super.key, this.isChecked = false, this.onTap, this.opacity = 0});
  final bool isChecked;
  final void Function()? onTap;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedCheckIcon(isChecked: isChecked, opacity: opacity),
    );
  }
}

class AnimatedCheckIcon extends StatefulWidget {
  const AnimatedCheckIcon({
    super.key,
    required this.isChecked,
    required this.opacity,
  });

  final bool isChecked;
  final double opacity;

  @override
  State<AnimatedCheckIcon> createState() => _AnimatedCheckIconState();
}

class _AnimatedCheckIconState extends State<AnimatedCheckIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors().lightGrey4),
            color: widget.isChecked == false
                ? Colors.transparent
                : AppColors.primaryColor),
        child: AnimatedOpacity(
          opacity: widget.opacity,
          duration: const Duration(milliseconds: 400),
          child: Icon(
            Icons.check,
            color: widget.isChecked == false
                ? Colors.transparent
                : AppColors().white,
            size: 15.w,
          ),
        ));
  }
}
