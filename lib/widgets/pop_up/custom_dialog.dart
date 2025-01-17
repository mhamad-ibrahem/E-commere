import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/colors/app_colors.dart';
import '../buttons/custom_delete_button.dart';

customDialog(
    {required BuildContext context,
    Color? backGroundColor,
    double? radius,
    bool canDismiss = true,
    String? title,
    required Widget child}) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: title != null
                ? Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 14.sp),
                  )
                : null,
            backgroundColor: backGroundColor ?? AppColors().white,
            content: PopScope(
              canPop: canDismiss,
              onPopInvokedWithResult: (didPop, result) {},
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const Row(),
                      child,
                    ],
                  ),
                  if (canDismiss)
                    Positioned(
                        top: -59.h,
                        right: -17.w,
                        child: const CustomExitButton()),
                ],
              ),
            ),
          ));
}
