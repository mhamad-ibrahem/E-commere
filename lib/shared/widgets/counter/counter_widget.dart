import 'package:flutter/material.dart';

import '../../../core/common/colors/app_colors.dart';
class SharedCounterWidget extends StatelessWidget {
  const SharedCounterWidget(
      {super.key,
      required this.quantity,
      this.increment,
      this.decrement,
      this.iconSize,
      this.isProductDetails = false});
  final int quantity;
  final void Function()? increment;
  final void Function()? decrement;
  final double? iconSize;
  final bool isProductDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: decrement,
            icon: Icon(
              Icons.remove_circle,
              color:
                  isProductDetails ? AppColors().white : AppColors().darkGrey,
              size: iconSize,
            )),
        Text(
          "$quantity",
          style: isProductDetails
              ? Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors().white)
              : Theme.of(context).textTheme.displaySmall,
        ),
        IconButton(
            onPressed: increment,
            icon: Icon(
              Icons.add_circle,
              color:
                  isProductDetails ? AppColors().white : AppColors().darkGrey,
              size: iconSize,
            )),
      ],
    );
  }
}
