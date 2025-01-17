
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/size/app_size.dart';

class CustomDropDownBorder extends StatelessWidget {
  const CustomDropDownBorder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: AppSize.isTabletScreen(context: context)?10.h:0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: child);
  }
}
