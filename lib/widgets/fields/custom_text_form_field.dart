import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/colors/app_colors.dart';
// MARK: CONSTRUCTOR AND PARAMS
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.hint,
    this.obscure = false,
    this.textEditingController,
    this.validator,
    this.inputType,
    this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.numberOfLines,
    this.isEnable = true,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.isField = false,
    this.isWhiteInput=false,
    this.onLeadingTap,
    this.fillColor,
    this.radius,
    this.contentPadding,
  });
  /// prefix icon before the text 
  final Widget? icon;
  /// a text show if the the text field is empty
  final String? hint;
  /// to show the text inside the field or hide it with a point like this ..... usually using it with password to hide it
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final int? numberOfLines;
  final void Function()? onTap;
  final void Function()? onLeadingTap;
  final FocusNode? focusNode;
  final bool isEnable;
  final bool isWhiteInput;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final bool isField;
  final Color? fillColor;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    // MARK:  BUILD METHOD
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
    // MARK: TEXT INPUT STYLE
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color:isWhiteInput? AppColors().white: AppColors().black,
            fontSize: 14.sp,
          ),
      obscureText: obscure,
      enabled: isEnable,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: numberOfLines ?? 1,
      cursorColor: AppColors().grey,
      keyboardType: inputType,
      // MARK: DECORATION
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors().red, fontSize: 12.sp),
          fillColor: fillColor ?? AppColors().grey,
          enabled: isEnable,
          filled: isField,
          suffixIcon: suffixIcon,
          prefixIcon: icon != null
              ? Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: GestureDetector(
                    onTap: onLeadingTap,
                    child: icon,
                  ),
                )
              : null,
          contentPadding: contentPadding ??
               EdgeInsets.only(left: 0.w, right: 0.w, top: 20.h, bottom: 20.h),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors().darkGrey, fontSize: 12.sp),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: BorderSide(color: AppColors().darkGrey, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: BorderSide(color: AppColors().darkGrey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: BorderSide(color: AppColors().red, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          )),
    );
  }
}
