import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/common/colors/app_colors.dart';
import '../../core/routes/app_router.dart';
import '../../shared/widgets/loading/loading_points/loading_points.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
    this.color,
    this.radius,
    this.onTap,
    this.isLoading = false,
    this.iconSize,
    this.padding,
  });
  final Color? color;
  final double? radius;
  final void Function()? onTap;
  final bool isLoading;
  final double? iconSize;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            AppRouter.back(context: context);
          },
      child: CircleAvatar(
        radius: radius ?? 20.w,
        backgroundColor: color ?? AppColors().red.withOpacity(0.7),
        child: isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: padding ?? 3.w),
                child: const LoadingPoint(),
              )
            : Center(
                child: Icon(
                  Icons.close,
                  size: iconSize ?? 24.w,
                  color: AppColors().white,
                ),
              ),
      ),
    );
  }
}
