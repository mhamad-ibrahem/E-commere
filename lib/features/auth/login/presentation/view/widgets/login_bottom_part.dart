import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/routes/constant/app_routes.dart';
import '../../../../../../widgets/buttons/custom_button.dart';
import '../../provider/login_provider.dart';

class LoginBottomPartWidget extends HookConsumerWidget {
  const LoginBottomPartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerRead = ref.read(loginProvider.notifier);
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // AppRouter.navigateToNamed(
            //     context: context, routeName: AppRoutes().forgetPasswordRoute);
          },
          child: Text(
            "Forgot Password?",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors().white,
                ),
          ),
        ),
        CustomButton(
          buttonWidth: AppSize.screenWidth(context: context),
          height: 50.h,
          buttonBody: "Login",
          onTap: () {
            providerRead.login(context);
          },
        ),
        TextButton(
          onPressed: () async {
            AppRouter.navigateToNamed(
                context: context, routeName: AppRoutes().register);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors().white, fontSize: 13.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Register',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
