import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/assets/app_assets.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/size/app_size.dart';
import '../../../../../../widgets/app_bar/custom_app_bar.dart';
import '../widgets/login_bottom_part.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                title: ' Login',
                context: context,
                isBack: false,
                isWhite: true,
                isCenterTitle: false),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Again",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors().white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Please fill all field to login",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors().white),
                  ),
                  const LoginFormWidget(),
                  const LoginBottomPartWidget(),
                ],
              ),
            )),
      ],
    );
  }
}
