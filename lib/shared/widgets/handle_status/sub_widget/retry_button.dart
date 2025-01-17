import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/colors/app_colors.dart';



class RetryButton extends StatelessWidget {
  final VoidCallback onTap;
  const RetryButton({
    super.key,
    required this.onTap,
    this.colorOfText,
    this.colorOfRetryText, this.title,
    this.isWithUpperText=true
  });
  final Color? colorOfText;
  final Color? colorOfRetryText;
  final String? title;
  final bool isWithUpperText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         if(isWithUpperText) Text(
           title?? 'Something went wrong',
           textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color:colorOfText?? AppColors().black,fontSize: 16.sp),
          ),
          TextButton(
            style: ButtonStyle(backgroundColor:WidgetStateProperty.all<Color>( Colors.transparent)),
              onPressed: onTap,
              child: Text('Retry',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color:colorOfRetryText?? AppColors.primaryColor,fontSize: 16.sp))),
        ],
      ),
    );
  }
}
