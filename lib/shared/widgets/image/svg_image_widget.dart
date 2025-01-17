import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssetImageWidget extends StatelessWidget {
  const SvgAssetImageWidget(
      {super.key, required this.image, this.height, this.width, this.color,  this.fit=BoxFit.contain});
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: fit,
      height: height ?? 20.h,
      width: width ?? 20.w,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
