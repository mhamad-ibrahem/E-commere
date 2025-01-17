import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/size/app_size.dart';
import '../../../../../shared/widgets/image/custom_cached_net_image.dart';
import '../../provider/home_provider.dart';

class HomeBannerWidget extends HookConsumerWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(homeProvider);
    return SizedBox(
        height: 350.h,
        width: AppSize.screenWidth(context: context),
        child: Swiper(
          loop: false,
          itemCount: provider.sliders.length,
          autoplay: true,
          outer: false, //make indicator inside image
          autoplayDelay: 4000,
          duration: 900,
          itemBuilder: (BuildContext context, int index) {
            return CustomCachedNetImage(
              imageUrl: provider.sliders[index].image,
              height: 350.h,
              width: AppSize.screenWidth(context: context),
              fit: BoxFit.cover,
            );
          },
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: AppColors().grey,
            activeColor: AppColors.primaryColor,
            size: 8.0.w,
            activeSize: 9.0.w,
          )),
        ));
  }
}
