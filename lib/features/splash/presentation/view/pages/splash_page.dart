import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_e_commerce/features/splash/presentation/provider/splash_provider.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/size/app_size.dart';
import '../../../../../core/config/classes/status_request.dart';
import '../../../../../shared/widgets/handle_status/sub_widget/retry_button.dart';
import '../../../../../shared/widgets/loading/loading_logo.dart';
import '../../../../../shared/widgets/loading/loading_points/loading_points.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(splashProvider);
    final providerRead = ref.read(splashProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedLogo(
            height: AppSize.screenHeight(context: context) * 0.35,
            width: AppSize.screenWidth(context: context),
          ),
          SizedBox(
            height: 20.h,
          ),
          provider.statusRequest == StatusRequest.loading
              ? LoadingPoint(
                  size: 20.w,
                )
              : provider.statusRequest == StatusRequest.failure
                  ? RetryButton(
                      isWithUpperText: false,
                      onTap: () {
                        providerRead.initialServices(context);
                      })
                  : const SizedBox()
        ],
      ),
    );
  }
}
