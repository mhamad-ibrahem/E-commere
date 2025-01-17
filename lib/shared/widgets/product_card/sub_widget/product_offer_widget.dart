
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/colors/app_colors.dart';

class ProductOfferWidget extends StatelessWidget {
  const ProductOfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Text(
        '-20%',
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColors().white,fontSize: 12.sp),
      ),
    );
  }
}
