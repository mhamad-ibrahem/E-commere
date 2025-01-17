import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/colors/app_colors.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget(
      {super.key, this.onTap, required this.tabs, this.initialIndex = 0, this.tabAlignment});
  final void Function(int)? onTap;
  final List<Widget> tabs;
  final int initialIndex;
  final TabAlignment? tabAlignment;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: TabBar(
        padding: EdgeInsets.zero,
        labelPadding:  EdgeInsets.symmetric(horizontal: 10.w),
        indicatorPadding:  EdgeInsets.zero,
        tabAlignment:tabAlignment?? TabAlignment.start,
        isScrollable: true,
        splashBorderRadius: BorderRadius.circular(25.r),
        onTap: onTap,
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25.r)
        ),
        labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors().black,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(
                color: AppColors().darkGrey,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp),
        labelColor: AppColors().white,
        unselectedLabelColor: AppColors().darkGrey,
        indicatorWeight: 4,
        tabs: tabs,
      ),
    );
  }
}
