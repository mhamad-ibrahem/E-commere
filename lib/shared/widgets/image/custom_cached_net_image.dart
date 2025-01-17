import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/colors/app_colors.dart';
import '../loading/shimmer_loading_widget.dart';

class CustomCachedNetImage extends StatelessWidget {
  const CustomCachedNetImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: imageUrl,
          fit: fit ?? BoxFit.cover,
          //loading state
          placeholder: (context, url) => ShimmerLoadingWidget.rectangle(
                height: height ?? 150.h,
                width: width ?? 200.w,
                borderRadius: borderRadius,
              ),
          //error state
          errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                color: AppColors().grey,
                height: height ?? 150.h,
                width: width ?? 200.w,
                child: Center(
                    child: SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: Icon(
                          Icons.error_outline_outlined,
                          color: AppColors().black,
                          size: 24.w,
                        ))),
              )),
    );
  }
}
