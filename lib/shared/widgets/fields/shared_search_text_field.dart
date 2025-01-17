
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/assets/app_assets.dart';
import '../../../core/common/colors/app_colors.dart';
import '../../../widgets/fields/custom_text_form_field.dart';
import '../image/svg_image_widget.dart';

class SharedSearchTextField extends StatelessWidget {
  const SharedSearchTextField(
      {super.key,
      this.textEditingController,
      this.validator,
      this.onFieldSubmitted});
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      radius: 12.r,
      textEditingController: textEditingController,
      validator: validator,
      hint: "Search...",
      onFieldSubmitted: onFieldSubmitted,
      suffixIcon: GestureDetector(
          onTap: () {
            if (textEditingController != null) {
              textEditingController!.clear();
            }
          },
          child: Icon(
            Icons.close,
            size: 20.w,
          )),
      icon: SvgAssetImageWidget(
        image: AppAssets().searchIcon,
        color: AppColors().lightGrey4,
        height: 30.h,
        width: 30.w,
      ),
    );
  }
}
