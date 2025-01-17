import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/common/colors/app_colors.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape? shapeBorder;
  final BorderRadiusGeometry? borderRadius;
  const ShimmerLoadingWidget.rectangle({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = BoxShape.rectangle,
    this.borderRadius,
  });
  const ShimmerLoadingWidget.circle({
    super.key,
    required this.height,
    required this.width,
    this.shapeBorder = BoxShape.circle,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: AppColors().grey,
            shape: shapeBorder!,
            borderRadius: borderRadius),
      ),
    );
  }
}
