import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../core/common/assets/app_assets.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../shared/widgets/image/svg_image_widget.dart';
import '../../../injection/main_injection.dart';

class MainNavBar extends HookConsumerWidget {
  const MainNavBar({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(mainProvider.notifier);
    final providerWatch = ref.watch(mainProvider);
    final providerRead = ref.read(mainProvider.notifier);
    return Container(
      height: 83.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors().lightGrey2!, width: 2)),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
      child: Row(
        children: [
          Expanded(
              child: navBarItem(
            scale: provider.scale,
            context: context,
            icon: providerWatch.navBarIndex == 0
                ? AppAssets().homeIcon
                : AppAssets().homeEmptyIcon,
            label: 'Home',
            isSelected: providerWatch.navBarIndex == 0,
            onTap: () {
              providerRead.changeMainScreen(0);
            },
          )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: navBarItem(
            scale: provider.scale2,
            context: context,
            icon: providerWatch.navBarIndex == 1
                ? AppAssets().searchIcon
                : AppAssets().searchIcon,
            label: 'Search',
            isSelected: providerWatch.navBarIndex == 1,
            onTap: () {
              providerRead.changeMainScreen(1);
            },
          )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: navBarItem(
            scale: provider.scale3,
            context: context,
            icon: providerWatch.navBarIndex == 2
                ? AppAssets().bagFillIcon
                : AppAssets().bagIcon,
            label: 'Bag',
            isSelected: providerWatch.navBarIndex == 2,
            onTap: () {
              providerRead.changeMainScreen(2);
            },
          )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: navBarItem(
            scale: provider.scale4,
            context: context,
            icon: providerWatch.navBarIndex == 3
                ? AppAssets().favoriteFillIcon
                : AppAssets().favoriteIcon,
            label: 'Favorites',
            isSelected: providerWatch.navBarIndex == 3,
            onTap: () {
              providerRead.changeMainScreen(3);
            },
          )),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: navBarItem(
            scale: provider.scale5,
            context: context,
            icon: providerWatch.navBarIndex == 4
                ? AppAssets().profileFillIcon
                : AppAssets().profileIcon,
            label: 'Profile',
            isSelected: providerWatch.navBarIndex == 4,
            onTap: () {
              providerRead.changeMainScreen(4);
            },
          )),
        ],
      ),
    );
  }

  Widget navBarItem({
    required String icon,
    required String label,
    required BuildContext context,
    required bool isSelected,
    required void Function()? onTap,
    required double scale,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        curve: Curves.easeInOutSine,
        duration: const Duration(milliseconds: 500),
        scale: scale,
        child: Column(
          children: [
            SvgAssetImageWidget(
              image: icon,
              height: 27.h,
              width: 27.w,
              color:
                  isSelected ? AppColors.primaryColor : AppColors().lightGrey4,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors().lightGrey4,
                  fontSize: 10.sp),
            )
          ],
        ),
      ),
    );
  }
}
