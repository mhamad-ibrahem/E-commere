
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../core/common/assets/app_assets.dart';
import '../../../core/common/colors/app_colors.dart';
import '../../../core/common/size/app_size.dart';
import '../../../core/helper/localization/localization_helper.dart';
import '../../../main.dart';

class AppToastWidget {
  static BuildContext context = navigatorKey.currentState!.context;

  //success
  static void showSuccessToast({required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar(isSuccess: true, message: message));
  }

//error
  static void showErrorToast({required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar(isSuccess: false, message: message));
  }

  static SnackBar snackBar({required bool isSuccess, required String message}) {
    _SnackBarAnimationWidgetState state = _SnackBarAnimationWidgetState()
      ..initState();
    state.controller.forward();

    return SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors().white,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      // showCloseIcon: true,
      animation: state.animation,
      margin: EdgeInsets.only(
          bottom: AppSize.screenHeight(context: context) - 140.h,
          left: 20.w,
          right: 20.w),
      padding: EdgeInsets.all(6.w),
      elevation: 3,
      content: Row(
        children: [
          LottieBuilder.asset(
            isSuccess
                ? AppAssets().successAnimation
                : AppAssets().errorAnimation,
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: Text(message,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: LocalizationHelper.isEnglishLanguage()
                    ? TextAlign.start
                    : TextAlign.end),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            child: Icon(
              Icons.close,
              color: AppColors().black,
              size: 20.w,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
    );
  }
}

//animation

class SnackBarAnimationWidget extends StatefulWidget {
  const SnackBarAnimationWidget({super.key});

  @override
  State<SnackBarAnimationWidget> createState() =>
      _SnackBarAnimationWidgetState();
}

class _SnackBarAnimationWidgetState extends State<SnackBarAnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    
    controller = AnimationController(
      duration: const Duration(seconds: 0),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
