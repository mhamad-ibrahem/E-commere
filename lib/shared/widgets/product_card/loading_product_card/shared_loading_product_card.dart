import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../loading/shimmer_loading_widget.dart';

class SharedLoadingProductCard extends StatelessWidget {
  const SharedLoadingProductCard({super.key, this.imageWidth});
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerLoadingWidget.rectangle(
          height: 184.h,
          width: imageWidth ?? 148.w,
          borderRadius: BorderRadius.circular(8.r),
        ),
        SizedBox(
          height: 10.h,
        ),
        ShimmerLoadingWidget.rectangle(
          height: 20.h,
          width: imageWidth ?? 148.w,
          borderRadius: BorderRadius.circular(6.r),
        ),
        SizedBox(
          height: 5.h,
        ),
        ShimmerLoadingWidget.rectangle(
          height: 20.h,
          width: imageWidth ?? 148.w,
          borderRadius: BorderRadius.circular(6.r),
        ),
      ],
    );
  }
}
