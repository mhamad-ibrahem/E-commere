import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../features/home/data/model/home_products_model.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.model});
  final HomeProductsModel? model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 7.h,
        ),
        _productRateRowWidget(context),
        SizedBox(
          height: 5.h,
        ),
        Text(
          model?.name??'Test',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 11.sp, color: AppColors().lightGrey4),
          maxLines: 1,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Evening Dress",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14.sp,
              ),
          maxLines: 1,
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          children: [
            Text(
              "15\$",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 11.sp,
                  color: AppColors().lightGrey4,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "12\$",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        )
      ],
    );
  }

  Row _productRateRowWidget(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            Icons.star_sharp,
            size: 14.w,
            color: AppColors.yellow,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          "(10)",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 10.sp, color: AppColors().lightGrey4),
        ),
      ],
    );
  }
}
