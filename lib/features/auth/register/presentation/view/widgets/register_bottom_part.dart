import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../widgets/buttons/custom_button.dart';
import '../../provider/register_provider.dart';

class RegisterBottomPartWidget extends HookConsumerWidget {
  const RegisterBottomPartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerWatch = ref.watch(registerProvider.notifier);
    return Column(
      children: [
        CustomButton(
          buttonWidth: AppSize.screenWidth(context: context),
          height: 50.h,
          buttonBody: "Register",
          onTap: () {
            registerWatch.register(context);
          },
        ),
        TextButton(
          onPressed: () {
            AppRouter.back(context: context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors().white, fontSize: 13.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Login',
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
