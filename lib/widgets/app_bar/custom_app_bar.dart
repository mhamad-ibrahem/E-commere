import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common/colors/app_colors.dart';
import '../../core/routes/app_router.dart';
AppBar customAppBar({
  //app bar title
  required String title,
  //context of the build method for the current page
  required BuildContext context,
  //For change the status bar system style 
  SystemUiOverlayStyle? systemOverlayStyle,
  //a list of widget at the end of the app bar
  List<Widget>? actions,
  //to show back button or not
  bool isBack = true,
  //to add action for the back button instead of just go back
  VoidCallback? onPressed,
  //to make title and back button color white
  bool isWhite = false,
  //to make title at canter of the app bar
  bool isCenterTitle = true,
}) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    centerTitle: isCenterTitle,
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 50.h,
    title: Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: 18.sp,
            color: isWhite ? AppColors().white : AppColors().black,
          ),
    ),
    leading: isBack
        ? IconButton(
            onPressed: onPressed ??
                () {
                  AppRouter.back(context: context);
                },
            icon: Icon(Icons.arrow_back_ios,
                color: isWhite ? AppColors().white : AppColors().black,
                size: 24.w))
        : null,
    actions: actions,
  );
}
