import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/shared/widgets/handle_status/sub_widget/retry_button.dart';
import '../../../../../core/common/size/app_size.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../shared/widgets/product_card/loading_product_card/shared_loading_product_card.dart';
import '../../../../../shared/widgets/product_card/shared_product_card_widget.dart';
import '../../provider/home_provider.dart';
import 'custom/custom_home_sections_title_widget.dart';

class HomeSaleWidget extends HookConsumerWidget {
  const HomeSaleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(salesProductsProvider);
    return isThereAnError(provider.statusRequest)
        ? Container(
            height: 300,
            width: AppSize.screenWidth(context: context),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: RetryButton(onTap: () => ref.refresh(salesProductsProvider)),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHomeSectionsTitleWidget(
                  title: 'Sale',
                  subtitle: 'Super summer sale',
                ),
                SizedBox(
                  height: 270.h,
                  width: AppSize.screenWidth(context: context),
                  child: ListView.separated(
                    itemCount: provider.statusRequest == StatusRequest.loading
                        ? 5
                        : provider.products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        provider.statusRequest == StatusRequest.loading
                            ? const SharedLoadingProductCard()
                            : SharedProductCardWidget(
                                model: provider.products[index],
                              ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}
