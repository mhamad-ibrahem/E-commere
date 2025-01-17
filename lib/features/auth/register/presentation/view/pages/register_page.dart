import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/assets/app_assets.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';
import '../../../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/register_bottom_part.dart';
import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            AppAssets().authBackground,
            height: AppSize.screenHeight(context: context),
            width: AppSize.screenWidth(context: context),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: customAppBar(
              title: ' Register',
              context: context,
              isWhite: true,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create account",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors().white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Are you new to our platform please fill all field to continue",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors().white),
                  ),
                  const RegisterFormWidget(),
                  const RegisterBottomPartWidget(),
                ],
              ),
            )),
      ],
    );
  }
}
