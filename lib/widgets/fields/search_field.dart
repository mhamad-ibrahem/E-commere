

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/colors/app_colors.dart';
import '../../../widgets/fields/custom_text_form_field.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget(
      {super.key, this.onFieldSubmitted, this.searchTextEditingController,this.isReadOnly=false, this.onTap});
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? searchTextEditingController;
  final void Function()? onTap;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      isField: true,
      onTap: onTap,
      isReadOnly: isReadOnly,
      radius: 30,
      hint: 'Search...',
      textEditingController: searchTextEditingController,
      onFieldSubmitted: onFieldSubmitted,
      fillColor: AppColors().white,
      icon: Icon(
        Icons.search,
        color: AppColors.primaryColor,size: 22.w,
      ),
    );
  }
}
