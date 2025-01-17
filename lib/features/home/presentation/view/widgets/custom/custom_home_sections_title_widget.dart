
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/colors/app_colors.dart';

class CustomHomeSectionsTitleWidget extends StatelessWidget {
  const CustomHomeSectionsTitleWidget(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30.sp),
            ),
            GestureDetector(
              child: Text(
                'View all',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 11.sp,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 11.sp, color: AppColors().lightGrey4),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
