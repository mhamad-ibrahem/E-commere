import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/colors/app_colors.dart';
import 'spin_kit_three_bounce.dart';


class LoadingPoint extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingPoint({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? AppColors().white,
      size: size ?? 12.w,
    );
  }
}
