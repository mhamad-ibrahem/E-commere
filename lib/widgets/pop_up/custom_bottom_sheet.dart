
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common/colors/app_colors.dart';
import '../../core/common/size/app_size.dart';
import '../../core/helper/log_helper/log_helper.dart';
import '../../core/routes/app_router.dart';

customBottomSheet(
    {double? height,
    Color? backGroundColor,
    double? radius,
    required Widget child,
    required BuildContext context}) {
  showBottomSheet(
    context: context,
    showDragHandle: false,
    enableDrag: false,
    backgroundColor: backGroundColor,
    builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: height ?? 180.h,
        width: AppSize.screenWidth(context: context),
        decoration: BoxDecoration(
            color: backGroundColor ?? AppColors().white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(radius ?? 50))),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                LogHelper.logCyan("back");
                AppRouter.back(context: context);
              },
              child: Container(
                width: 120.w,
                height: 50.h,
                margin: EdgeInsets.only(bottom: 20.h),
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
                    color: AppColors.primaryColor),
                child: Icon(
                  Icons.arrow_downward_rounded,
                  color: AppColors().white,
                  size: 25.w,
                ),
              ),
            ),
            child,
          ],
        )),
  );
}
