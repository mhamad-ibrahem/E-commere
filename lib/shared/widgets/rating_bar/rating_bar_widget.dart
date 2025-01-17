
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/colors/app_colors.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(
      {super.key,
      this.initialRating = 0,
      this.axis = Axis.horizontal,
      this.itemCount = 5,
      this.iconSize,
      this.isActive = true,
      required this.onRatingUpdate});
  final double initialRating;
  final Axis axis;
  final int itemCount;
  final double? iconSize;
  final bool isActive;
  final void Function(double) onRatingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 0,
      direction: axis,
      allowHalfRating: true,
      itemCount: itemCount,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: AppColors.yellow,
        size: iconSize ?? 22.w,
      ),
      tapOnlyMode: isActive,
      onRatingUpdate: onRatingUpdate,
    );
  }
}
