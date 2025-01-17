
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/colors/app_colors.dart';

class ProductFavoriteButtonWidget extends StatelessWidget {
  const ProductFavoriteButtonWidget({super.key, this.onTap,  this.isInFavorite=false});
final void Function()? onTap;
final bool isInFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 3,
        color: AppColors().white,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
          child: Icon(
          isInFavorite? Icons.favorite_rounded:  Icons.favorite_border_outlined,
            color:isInFavorite?AppColors().red : AppColors().lightGrey4,
            size: 22.w,
          ),
        ),
      ),
    );
  }
}

