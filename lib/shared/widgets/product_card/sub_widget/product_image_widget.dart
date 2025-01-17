import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../features/home/data/model/home_products_model.dart';
import '../../image/custom_cached_net_image.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key, required this.model});
  final HomeProductsModel? model;
  @override
  Widget build(BuildContext context) {
    return CustomCachedNetImage(
      imageUrl: model?.image??'',
      height: 184.h,
      width: 148.w,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}
