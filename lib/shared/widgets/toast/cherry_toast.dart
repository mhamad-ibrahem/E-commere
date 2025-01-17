import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../core/common/assets/app_assets.dart';
import '../../../core/helper/localization/localization_helper.dart';
import '../../../core/helper/log_helper/log_helper.dart';
import '../../../main.dart';

class AppCherryToast {
  static BuildContext context = navigatorKey.currentState!.context;
  static showErrorToast({
    required String message,
  }) {
    LogHelper.logError(message);
    CherryToast.error(
            iconWidget: LottieBuilder.asset(
              AppAssets().errorAnimation,
              height: 30.h,
              width: 30.w,
            ),
            displayCloseButton: false,
            title: Text(message,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 14.sp),
                textAlign: LocalizationHelper.isEnglishLanguage()
                    ? TextAlign.start
                    : TextAlign.end),
            animationType: AnimationType.fromRight,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(context);
  }

  static showSuccessToast({
    required String message,
  }) {
    LogHelper.logSuccess(message);
    CherryToast.success(
            iconWidget: LottieBuilder.asset(
              AppAssets().successAnimation,
              height: 40.h,
              width: 40.w,
            ),
            displayCloseButton: false,
            title: Text(message,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 14.sp),
                textAlign: LocalizationHelper.isEnglishLanguage()
                    ? TextAlign.start
                    : TextAlign.end))
        .show(context);
  }
}
