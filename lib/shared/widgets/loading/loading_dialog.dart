import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/colors/app_colors.dart';

showLoadingDialog({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
          elevation: 0,
          shadowColor: AppColors().black,
          backgroundColor: Colors.transparent,
          content: PopScope(
            canPop: false,
            child: Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )));
}
