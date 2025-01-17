import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/colors/app_colors.dart';
import '../../core/common/size/app_size.dart';
import '../../shared/widgets/loading/loading_points/loading_points.dart';


class CustomButton extends StatelessWidget {
  // MARK: CONSTRUCTOR AND PARAMS
  /// A button used in the hall application
  const CustomButton({
    super.key,
    required this.buttonBody, 
    required this.onTap,
    this.buttonWidth,
    this.height,
    this.isReverseColor = false,
    this.isLoading = false,
    this.buttonColor,
    this.radius,
    this.child,
    this.textColor,
    this.padding, this.loadingPointColor,
  });
  /// The width of the button
  final double? buttonWidth;
  /// action to do after pressing on the button
  final VoidCallback? onTap;
  /// The text inside the button
  final String buttonBody;
  /// The height of the button
  final double? height;
  /// The radius of the button
  final double? radius;
  /// To reverse button color between text inside and button color
  final bool isReverseColor;
  /// make a loading inside the button
  final bool isLoading;
  //// the color of the button
  final Color? buttonColor;
  /// the text inside button color
  final Color? textColor;
  /// the loading point inside button color
  final Color? loadingPointColor;
  /// a widget if need to add widget instead of sample text inside button
  final Widget? child;
  /// padding inside the button
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    // MARK: BUILD METHOD
    return MaterialButton(
      padding: padding ?? const EdgeInsets.all(0),
      onPressed: onTap,
      color: isReverseColor == true
          ? AppColors().white
          : buttonColor ?? AppColors.primaryColor,
      disabledColor: AppColors().grey,
      disabledTextColor: AppColors().black,
      height: height ?? 40.h,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(radius ?? AppSize.appCustomRadius.r),
          side: isReverseColor == true
              ?  const BorderSide(color: AppColors.primaryColor)
              : BorderSide.none),
      child: SizedBox(
        width: buttonWidth ?? AppSize.screenWidth(context: context) * 0.6,
        child: child ??
            Center(
              child: isLoading == false
                  ? Text(
                      buttonBody,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(
                            color: AppColors().white,
                            fontSize: 14.sp,
                          )
                          .copyWith(
                              color: isReverseColor == true
                                  ? AppColors.primaryColor
                                  : textColor ?? AppColors().white),
                    )
                  :  LoadingPoint(color:loadingPointColor ,),
            ),
      ),
    );
    // MARK: END OF BUILD METHOD
  }
}
