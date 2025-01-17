import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/routes/constant/app_routes.dart';
import '../../../features/home/data/model/home_products_model.dart';
import 'sub_widget/product_favorite_button_widget.dart';
import 'sub_widget/product_image_widget.dart';
import 'sub_widget/product_info_widget.dart';
import 'sub_widget/product_offer_widget.dart';

class SharedProductCardWidget extends StatelessWidget {
  const SharedProductCardWidget({super.key,  this.model});
  final HomeProductsModel? model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.navigateToNamed(
            context: context, routeName: AppRoutes().productDetailsRoute);
      },
      child: SizedBox(
        width: 148.w,
        child: Stack(
          children: [
            Column(
              children: [
                ProductImageWidget(
                  model: model,
                ),
                ProductInfoWidget(
                  model: model,
                ),
              ],
            ),
            const ProductOfferWidget(),
            Positioned(
                right: 0.w,
                top: 153.h,
                child: const ProductFavoriteButtonWidget())
          ],
        ),
      ),
    );
  }
}
